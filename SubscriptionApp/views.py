from django.shortcuts import render

# Create your views here.
from LessonApp.models import Lesson
from SubscriptionApp.models import *
from SubscriptionApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *


class UserSubscriptionsAPI(ListAPIView):
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get(self, request):
        try:
            data = {}

            data['forex robots'] = SubscriptionSerializer(Subscription.objects.filter(product__is_service=0,user__id=self.request.user.id,is_free_trail=0), many=True).data
            data['free trail'] = SubscriptionSerializer(Subscription.objects.filter(product__is_service=0,user__id=self.request.user.id,is_free_trail=1), many=True).data
            data['VPS Service'] = SubscriptionSerializer(Subscription.objects.filter(product__is_service=1,user__id=self.request.user.id), many=True).data

            return ResponseFunction(1, "Subscription data", data)
        except Exception as e:
            print("Exception Occured ", e)
            return ResponseFunction(0, f"Exception occured {str(e)} at Line {printLineNo()}", {})

class SubscriptionAPI(ListAPIView):

    serializer_class = SubscriptionSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get_queryset(self):
        pagination = self.request.GET.get('pagination', '1')
        if pagination == '0':
            # print("Pagination None")
            self.pagination_class = None

        id = self.request.GET.get('id', '')
        is_dropdown = self.request.GET.get('is_dropdown', False)
        name = self.request.GET.get('name','')
        topic_code = self.request.GET.get('topic_code','')


        if is_dropdown=='1':
            # print("Drop down get request")
            self.serializer_class = SubscriptionDropdownSerializer

        qs = Subscription.objects.all()

        if id: qs = qs.filter(id=id)
        if name: qs = qs.filter(name__icontains=name)
        if topic_code: qs = qs.filter(topic_code=topic_code)


        return qs.order_by('-id')

    def post(self, request):
        print("Request data ",request.data)
        required = ["name"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")

        try:
            id = self.request.POST.get("id", "")
            updating = False
            if id:
                updating = True
                # print("Subscription Updating")
                Subscription_qs = Subscription.objects.filter(id=id)
                if not Subscription_qs.count():
                    return ResponseFunction(0, "Subscription Not Found", {})
                topic_obj = Subscription_qs.first()
                serializer = SubscriptionSerializer(topic_obj, data=request.data, partial=True)
                msg = "Data updated"

            else:
                # print("Adding new Subscription")
                serializer = SubscriptionSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)
            user_id = self.request.POST.get('user',self.request.user.id)
            # print("User_id ",user_id)

            # updating = True # [False,True] Business logic apply only on new subscription, Test case passed
            print("Free trail ", request.data.get('is_free_trail',''))
            user = setBusinessLogic(
                user_id,
                is_free_trail=request.data.get('is_free_trail',''),
                product=request.data.get('product',''),
                sub_product=request.data.get('sub_product',''),
                updating=updating
            ) #not considering free trail or not

            obj = serializer.save(user=user)

            return ResponseFunction(1, msg, SubscriptionSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})

    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Subscription.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Subscription.objects.filter(id__in=id).delete()
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

def setBusinessLogic(user_id,**kwargs):
    user_obj = UserDetails.objects.get(id=user_id)


    updating = kwargs.get('updating')
    is_free_trail = kwargs.get('is_free_trail')
    print("Free trail ",is_free_trail)
    print("Free trail ",type(is_free_trail))
    print("Updation status ",updating)
    if updating:
        print("No Business logic on updation")
        return user_obj
    if is_free_trail=="1":
        print("No Business logic on Free trail")
        return user_obj

    # pid = "" # with out product test case passed

    referal_code_used = user_obj.referal_code_used
    # referal_code_used = "" # without referal_code_used test case passed

    print("Referal code used ",referal_code_used)
    if referal_code_used:
        referer_qs = UserDetails.objects.filter(referal_code=user_obj.referal_code_used)
        # referer_qs = UserDetails.objects.filter(referal_code="UNKNOWNREFERAL") # unknown referal Test case passed

        if referer_qs.count() > 0:
            referer_obj = referer_qs.first()
            print("Refered User : ",referer_obj.username)
            referer_obj.business_count = referer_obj.business_count + 1
            # referer_obj.business_count = 100 # business count in [0,9,10,19,45,51,100] Test case passed

            if referer_obj.business_count:
                grade_obj = ""
                for grade in GRADE:
                    if referer_obj.business_count >= grade["business_count"]:
                        grade_obj = grade
                print("Grade: " , grade_obj)
                referer_obj.vip_rank = grade_obj['name']
                referer_obj.commission = grade_obj['margin']
                referer_obj.grade_name = grade_obj['name']


                pid = kwargs.get('product', '')
                spid = kwargs.get('sub_product', '')

                if spid:
                    print("SUBPRODUCT ")
                    sp_qs = SubProduct.objects.filter(id=spid)

                    if sp_qs.count() > 0: #sub product bug
                        sp_obj = sp_qs.first()
                        price = float(sp_obj.price)
                        # percentage of price added to referer wallet
                        commission_amount = (price) * grade_obj['margin'] / 100
                        if referer_obj.wallet_credited:
                            referer_obj.wallet_credited = float(referer_obj.wallet_credited) + commission_amount
                        else:
                            referer_obj.wallet_credited = commission_amount
                        print(f"Referer Walelt Updated by +{commission_amount} ie +{grade_obj['margin']}%({price})  | Total Balance : ",
                            referer_obj.wallet_credited)
                    else:
                        print("SubProduct Not Found")
                elif pid:
                    print("PRODUCT ")
                    p_qs = Product.objects.filter(id=pid)
                    if p_qs.count() > 0:
                        p_obj = p_qs.first()
                        price = float(p_obj.price)
                        # percentage of price added to referer wallet
                        commission_amount = (price) * grade_obj['margin']/100
                        referer_obj.wallet_credited = float(referer_obj.wallet_credited) + commission_amount
                        print(f"Referer Walelt Updated by +{commission_amount} ie +{grade_obj['margin']}%({price})  | Total Balance : ",referer_obj.wallet_credited)



            else:
                print("Didnt meet enough business ",referer_obj.business_count)
            referer_obj.save()
        else:
            print("Referal User Not Fount")
    else:
        print(f"{user_obj.username} NOT USED ANY REFERAL")

    return user_obj
