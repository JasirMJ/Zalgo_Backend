from django.shortcuts import render

# Create your views here.
from BannerApp.models import *
from BannerApp.serializers import BannerSerializer, BannerAppSerializer, BannerDropdownSerializer
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class BannerAPI(ListAPIView):

    serializer_class = BannerSerializer
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
            hero_banner = self.request.GET.get('hero_banner', '')
            exclude_item  = json.loads(self.request.GET.get('exclude_item','[]'))
            name = self.request.GET.get('name')
            type = self.request.GET.get('type',"")
            id = self.request.GET.get('id', '')

            # serializer change filters
            if is_user_app == '1':
                self.serializer_class = BannerAppSerializer
            if is_dropdown == '1':
                self.serializer_class = BannerDropdownSerializer
            # serializer change -end

            qs = Banner.objects.all()

            if name:
                qs = qs.filter(name__icontains=name)


            if id:
                qs = qs.filter(id=id)

            if type:
                qs = qs.filter(type=type)
            if hero_banner:
                qs = qs.filter(hero_banner=hero_banner)

            if len(exclude_item): qs = qs.exclude(id__in=exclude_item)

            return qs
        except Exception as e:
            print(f"{str(e)} LineNo : {printLineNo()}")
            return Banner.objects.none()

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
            type_list = ["hero","broker"]
            type = self.request.POST['type']
            if type not in type_list:
                return ResponseFunction(0,"type must be one of "+str(type_list),{})
            id = self.request.POST.get("id", "")
            if id:
                print("Banner Updating")
                _qs = Banner.objects.filter(id=id)
                if not _qs.count():
                    return ResponseFunction(0, "Banner Not Found",{})
                variant_obj = _qs.first()
                serializer = BannerSerializer(variant_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Banner")
                serializer = BannerSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)
            obj = serializer.save()

            # print("Data id or object : ", obj.id)
            return ResponseFunction(1, msg,BannerSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})


    def patch(self, request):

        required = ["keyword"]
        validation_errors = ValidateRequest(required, self.request.data)
        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")

        keyword = self.request.POST.get("keyword", "")
        keyword_list = ["category","product"]
        if keyword not in keyword_list:
            return ResponseFunction(0,"keyword value must be in "+str(keyword_list),{})

        try:

            if keyword=="category":
                id = self.request.POST.get('id', "")
                if id:
                    category =json.loads(self.request.POST.get('category', "[]"))
                    if not len(category):
                        return ResponseFunction(0,"required category as array",{})
                    _qs = Banner.objects.filter(id=id)
                    if _qs.count():
                        _obj = _qs.first()
                        obj_category = [item for item in Category.objects.filter(id__in=category)]
                        print("Catgory objs ",obj_category)
                        _obj.categorys.remove(*_obj.categorys.all())
                        _obj.categorys.add(*obj_category)
                        return ResponseFunction(1,"Category added",BannerSerializer(Banner.objects.get(id=id)).data)

                    else:
                        return ResponseFunction(0,"Section not found",{})
                else:
                    return ResponseFunction(0, "Required id", {})

            if keyword=="product":
                id = self.request.POST.get('id', "")
                if id:
                    product =json.loads(self.request.POST.get('product', "[]"))
                    if not len(product):
                        return ResponseFunction(0,"required product as array",{})
                    _qs = Banner.objects.filter(id=id)
                    if _qs.count():
                        _obj = _qs.first()
                        obj_product = [item for item in Product.objects.filter(id__in=product)]
                        print("Products objs ",obj_product)
                        _obj.products.remove(*_obj.products.all())
                        _obj.products.add(*obj_product)
                        return ResponseFunction(1,"Product added",BannerSerializer(Banner.objects.get(id=id)).data)

                    else:
                        return ResponseFunction(0,"Section not found",{})
                else:
                    return ResponseFunction(0, "Required id", {})

            return ResponseFunction(1,"Priority Updated ",BannerSerializer(Banner.objects.all()).data)
        except Exception as e:
            return ResponseFunction(0, {MESSAGE:"Failed","Error":str(e)},{})



    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Banner.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Banner.objects.filter(id__in=id).delete()
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
