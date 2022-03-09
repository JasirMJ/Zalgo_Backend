from django.shortcuts import render

# Create your views here.
from ProductApp.models import *
from ProductApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class ProductAPI(ListAPIView):

    serializer_class = ProductSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        pagination = self.request.GET.get('pagination', '1')
        if pagination == '0':
            # print("Pagination None")
            self.pagination_class = None

        id = self.request.GET.get('id', '')
        is_dropdown = self.request.GET.get('is_dropdown', False)
        from_date = self.request.GET.get('from_date','')
        to_date = self.request.GET.get('to_date','')
        customer = self.request.GET.get('customer','')
        is_product = self.request.GET.get('is_product','')
        is_service = self.request.GET.get('is_service',0)
        is_subscribable = self.request.GET.get('is_subscribable','')

        if is_dropdown=='1':
            # print("Drop down get Product")
            self.serializer_class = ProductDropdownSerializer

        qs = Product.objects.all()
        # qs = Product.objects.filter(is_subscribable=1)

        if id: qs = qs.filter(id=id)
        if is_subscribable: qs = qs.filter(is_subscribable=is_subscribable)
        if is_product: qs = qs.filter(is_product=is_product)
        # if is_service: qs = qs.filter(is_service=is_service)
        if from_date: qs = qs.filter(created_at__gte=from_date)
        if to_date: qs = qs.filter(created_at__lte=to_date)
        if customer: qs = qs.filter(Q(user__username__icontains=customer) | Q(user__mobile=customer))

        return qs.order_by('-id')

    def post(self, request):
        print("request data ",request.data)
        required = ["name"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")

        name = self.request.POST.get('name','')

        data = self.request.data

        try:

            id = self.request.POST.get("id", "")

            if id:
                print("Product Updating")
                _qs = Product.objects.filter(id=id)
                if not _qs.count():
                    return ResponseFunction(0, "Product Not Found", {})
                _obj = _qs.first()
                serializer = ProductSerializer(_obj, data=data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Product")
                serializer = ProductSerializer(data=data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save()

            return ResponseFunction(1, msg, ProductSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))
            return ResponseFunction(0, f"Excepction occured {str(e)}", {})


    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Product.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Product.objects.filter(id__in=id).delete()
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


class SubProductAPI(ListAPIView):

    serializer_class = SubProductSerializer
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

        # if is_dropdown=='1':
        #     print("Drop down get Product")
        #     self.serializer_class = ProductDropdownSerializer

        qs = SubProduct.objects.all()

        if id: qs = qs.filter(id=id)

        return qs

    def post(self, request):
        print("Request data ",self.request.data)
        required = ["name","product"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")

        name = self.request.POST.get('name','')

        # data = {
        #     "id": self.request.POST.get('id',''),
        #     "name": self.request.POST.get('name'),
        #     "Product_by": self.request.user.username,
        #     "customer_name": self.request.POST.get('customer_name',''),
        #     "account_number":  self.request.POST.get('account_number',''),
        #     "broker":  self.request.POST.get('broker',''),
        #     "server":  self.request.POST.get('server',''),
        #     "phone_number":  self.request.POST.get('phone_number',''),
        #     "password":  self.request.POST.get('password',''),
        #     "is_paid": self.request.POST.get('is_paid',False),
        #     "is_free_trail": self.request.POST.get('is_free_trail',False),
        # }
        data = self.request.data

        try:

            id = self.request.POST.get("id", "")
            product = self.request.POST.get('product', '')
            keyword = self.request.POST.get('keyword', 'add')

            p_obj = None
            if product:
                p_qs = Product.objects.filter(id=product)
                if p_qs.count():
                    p_obj = p_qs.first()
                else:
                    return ResponseFunction(0,"Product not found",{})



            if id:
                print("SubProduct Updating")
                _qs = SubProduct.objects.filter(id=id)
                if not _qs.count():
                    return ResponseFunction(0, "SubProduct Not Found", {})
                _obj = _qs.first()
                serializer = ProductSerializer(_obj, data=data, partial=True)
                msg = "Data updated"


            else:
                print("Adding new SubProduct")
                serializer = SubProductSerializer(data=data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save()

            if keyword == "add":
                p_obj.sub_product.add(obj)
            else:
                p_obj.sub_product.remove(obj)

            # if keyword == "add":
            #     obj.

            return ResponseFunction(1, msg, SubProductSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})


    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                SubProduct.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                SubProduct.objects.filter(id__in=id).delete()
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

