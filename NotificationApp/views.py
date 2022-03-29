from django.shortcuts import render

# Create your views here.
from NotificationApp.models import *
from NotificationApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class NotificationAPI(ListAPIView):

    serializer_class = NotificationSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get_queryset(self):

        try:
            print(self.request)

            pagination = self.request.GET.get('pagination', '1')
            if pagination == '0':
                print("Pagination None")
                self.pagination_class = None

            # serializer change -start
            is_dropdown = self.request.GET.get('is_dropdown', '0')
            is_user_app = self.request.GET.get('is_user_app', '0')
            hero_Notification = self.request.GET.get('hero_Notification', '')
            exclude_item  = json.loads(self.request.GET.get('exclude_item','[]'))
            name = self.request.GET.get('name')
            id = self.request.GET.get('id', '')

            # serializer change filters
            if is_user_app == '1':
                self.serializer_class = NotificationAppSerializer
            if is_dropdown == '1':
                self.serializer_class = NotificationDropdownSerializer
            # serializer change -end

            qs = Notification.objects.all()

            if name:
                qs = qs.filter(name__icontains=name)


            if id:
                qs = qs.filter(id=id)

            if len(exclude_item): qs = qs.exclude(id__in=exclude_item)

            return qs.order_by('-id')
        except Exception as e:
            print(f"{str(e)} LineNo : {printLineNo()}")
            return Notification.objects.none()

    def post(self, request):
        print("Received Data : ",request.data)
        l1 = ["name"]
        # l2 = ["name","discount as percentage or flat"]
        required = l1

        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")



        try:

            id = self.request.POST.get("id", "")
            if id:
                print("Notification Updating")
                _qs = Notification.objects.filter(id=id)
                if not _qs.count():
                    return ResponseFunction(0, "Notification Not Found",{})
                variant_obj = _qs.first()
                serializer = NotificationSerializer(variant_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Notification")
                serializer = NotificationSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)
            obj = serializer.save()

            # print("Data id or object : ", obj.id)
            return ResponseFunction(1, msg,NotificationSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})


    def patch(self, request):
        print("notification patch ",request.data)
        required = ["keyword"]
        validation_errors = ValidateRequest(required, self.request.data)
        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'], {})
        else:
            print("Receved required Fields")

        keyword = self.request.POST.get("keyword", "")

        list_keyword = ["mark_as_read","read_all","get_unread"]
        if keyword not in list_keyword:
            return ResponseFunction(0, "keyword value must be in " + str(list_keyword), {})

        msg = "Nothing happent"
        print("Keyword ",keyword)
        try:
            if keyword == "mark_as_read":
                id_list = self.request.POST["id_list"]
                id_list = json.loads(id_list)

                # id = self.request.POST["id"]
                print("Wishlist ",id_list)
                print("self.request.user ",self.request.user)
                print("Wishlist ",id_list)
                # _qs = Notification.objects.filter(user_id=self.request.user.id,id__in=id_list).update(read=1)

                Notification_List = []
                for x in id_list:

                    Notification_List.append(
                        UserNotificationStatus(user=self.request.user, notification_id=x,read=1)
                    )
                UserNotificationStatus.objects.bulk_create(Notification_List)
                msg = "Notification marked as read"

                return ResponseFunction(1, msg, {"Note":"API need to be called else pagination issue occures"})

            if keyword == "read_all":
                # _qs = Notification.objects.filter(user_id=self.request.user.id).update(read=1)

                #  get my unread notifications
                unread_qs = UserNotificationStatus.objects.filter(user=self.request.user,read=0).values_list("notification_id",flat=1)
                unread_qs_ids = list(unread_qs)
                print("All unread notification id list ",unread_qs_ids)

                _qs = Notification.objects.all().exclude(id__in=unread_qs_ids)

                Notification_List = []
                for x in _qs:
                    Notification_List.append(
                        UserNotificationStatus(user=self.request.user, notification=x, read=1)
                    )
                UserNotificationStatus.objects.bulk_create(Notification_List)
                msg = "Marked all notification as read"

                return ResponseFunction(1, msg, {"unread": 0})

            if keyword == "get_unread":
                _qs = Notification.objects.filter(user_id=self.request.user.id,read=0)
                msg = "Total unread notifications"

                return ResponseFunction(1, msg, {"unread": _qs.count()})

            return ResponseFunction(1, msg, {})
        except Exception as e:
            printLineNo()
            return ResponseFunction(0, str(e)+" "+printLineNo(), {})


    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Notification.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Notification.objects.filter(id__in=id).delete()
                return ResponseFunction(1, "Deleted data having id " + str(id),{})

        except Exception as e:
            printLineNo()

            return Response(
                {
                    STATUS: False,
                    MESSAGE: str(e),
                    "line_no": printLineNo()
                }
            )
