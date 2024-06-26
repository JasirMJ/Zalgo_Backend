from django.shortcuts import render

# Create your views here.
from ZalgoAccountApp.models import *
from ZalgoAccountApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class ZalgoAccountAPI(ListAPIView):

    serializer_class = ZalgoAccountSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get_queryset(self):
        pagination = self.request.GET.get('pagination', '1')
        if pagination == '0':
            print("Pagination None")
            self.pagination_class = None

        id = self.request.GET.get('id', '')
        is_dropdown = self.request.GET.get('is_dropdown', False)
        name = self.request.GET.get('name','')
        course_code = self.request.GET.get('course_code','')

        if is_dropdown=='1':
            print("Drop down get request")
            self.serializer_class = ZalgoAccountDropdownSerializer

        qs = ZalgoAccount.objects.all()

        if id: qs = qs.filter(id=id)
        if name: qs = qs.filter(name__icontains=name)
        if course_code: qs = qs.filter(course_code=course_code)


        return qs.order_by('-id')

    def post(self, request):
        print("request data ",self.request.data)
        required = [
            "first_name",
            "last_name",
            "user",
            "email",
            "mobile",
            "gender",
            "dob",
            "national_id",
            "pancard",
            "house_name",
            "street_name",
            "pincode",
            "city",
        ]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")


        try:

            userid = self.request.POST.get('user',self.request.user.id)
            ZalgoAccount_qs = ZalgoAccount.objects.filter(user__id = userid )


            id = self.request.POST.get("id")

            if id:

                print("ZalgoAccount Updating")
                ZalgoAccount_qs = ZalgoAccount_qs.filter(id=id)
                if not ZalgoAccount_qs.count():
                    return ResponseFunction(0, "ZalgoAccount Not Found", {})
                za_obj = ZalgoAccount_qs.first()
                serializer = ZalgoAccountSerializer(za_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                if ZalgoAccount_qs.count():
                    return ResponseFunction(0, "User can only have one account", {})

                print("Adding new ZalgoAccount")
                serializer = ZalgoAccountSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save()
            # ZalgoAccount_qs.update(user__is_account_holder=1)
            user = obj.user
            user.is_account_holder = 1
            user.save()


            return ResponseFunction(1, msg, ZalgoAccountSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}: LineNo {printLineNo()}",{})

    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                ZalgoAccount.objects.all().delete()
                UserDetails.objects.all().update(is_account_holder=0)
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                za_qs = ZalgoAccount.objects.filter(id__in=id)
                user_list = za_qs.values_list("user__id",flat=True)
                # print("user_list ",list(user_list))
                za_qs.delete()
                UserDetails.objects.filter(id__in =  list(user_list)).update(is_account_holder=0)
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

