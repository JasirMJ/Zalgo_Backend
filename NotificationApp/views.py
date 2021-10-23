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

            return qs
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
