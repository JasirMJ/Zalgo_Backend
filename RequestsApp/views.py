from django.shortcuts import render

# Create your views here.
from ProductApp.models import Product
from RequestsApp.models import *
from RequestsApp.serializers import RequestModelSerializer, RequestModelDropdownSerializer
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class RequestModelAPI(ListAPIView):

    serializer_class = RequestModelSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        pagination = self.request.GET.get('pagination', '1')
        if pagination == '0':
            print("Pagination None")
            self.pagination_class = None

        id = self.request.GET.get('id', '')
        is_dropdown = self.request.GET.get('is_dropdown', False)
        from_date = self.request.GET.get('from_date','')
        to_date = self.request.GET.get('to_date','')
        customer = self.request.GET.get('customer','')
        user = self.request.GET.get('user','')
        account_number  = self.request.GET.get('account_number','')

        if is_dropdown=='1':
            print("Drop down get request")
            self.serializer_class = RequestModelDropdownSerializer

        qs = RequestModel.objects.all()

        if id: qs = qs.filter(id=id)
        if from_date: qs = qs.filter(created_at__gte=from_date)
        if to_date: qs = qs.filter(created_at__lte=to_date)
        if user: qs = qs.filter(Q(user__username__icontains=user) | Q(user__mobile=user))
        if customer: qs = qs.filter(Q(customer_name__icontains=customer) | Q(phone_number__icontains=customer))
        if account_number: qs = qs.filter(Q(account_number__icontains=account_number) )

        return qs.order_by('-id')

    def post(self, request):
        print("Data : ",request.data)
        required = ["name"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")

        name = self.request.POST.get('name','')
        # if name not in Product.objects.all().value_list('name',flat=True):
        #     return ResponseFunction(0,"Invalid name for request 'name'",REQUEST_TYPES)


        data = {

            "id": self.request.POST.get('id',''),
            "name": self.request.POST.get('name'),
            "request_by": self.request.user.username,
            "customer_name": self.request.POST.get('customer_name',''),
            "account_number":  self.request.POST.get('account_number',''),
            "broker":  self.request.POST.get('broker',''),
            "server":  self.request.POST.get('server',''),
            "phone_number":  self.request.POST.get('phone_number',''),
            "password":  self.request.POST.get('password',''),
            "is_paid": self.request.POST.get('is_paid',False),
            "is_free_trail": self.request.POST.get('is_free_trail',False),
        }

        try:

            id = self.request.POST.get("id", "")

            if id:
                print("RequestModel Updating")
                RequestModel_qs = RequestModel.objects.filter(id=id)
                if not RequestModel_qs.count():
                    return ResponseFunction(0, "RequestModel Not Found", {})
                variant_obj = RequestModel_qs.first()
                serializer = RequestModelSerializer(variant_obj, data=data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new RequestModel")
                serializer = RequestModelSerializer(data=data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save(user=self.request.user)

            return ResponseFunction(1, msg, RequestModelSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})

    def put(self, request):

        ResponseFunction(0,"Not enabled",{})

        id = self.request.POST.get("id")
        if not id or id == "":
            return Response({
                STATUS: False,
                MESSAGE: "Required object id as id"
            })
        serializer = RequestModelSerializer(RequestModel.objects.filter(id=id).first(), data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return ResponseFunction(1, "Data updated",{})


    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                RequestModel.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                RequestModel.objects.filter(id__in=id).delete()
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

