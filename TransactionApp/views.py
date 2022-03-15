from django.shortcuts import render

# Create your views here.
from LessonApp.models import Lesson
from SettingsApp.models import SettingsModel
from TransactionApp.models import *
from TransactionApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class TransactionAPI(ListAPIView):

    serializer_class = TransactionSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get_queryset(self):

        pagination = self.request.GET.get('pagination', '1')
        if pagination == '0':
            print("Pagination None")
            self.pagination_class = None

        id = self.request.GET.get('id', '')
        is_dropdown = self.request.GET.get('is_dropdown', False)
        transaction_id = self.request.GET.get('transaction_id', '')
        username = self.request.GET.get('username', '')
        product_name = self.request.GET.get('product_name', '')
        amount_in_min = self.request.GET.get('amount_in_min', '')
        amount_in_max = self.request.GET.get('amount_in_max', '')
        amount_out_min = self.request.GET.get('amount_out_min', '')
        amount_out_max = self.request.GET.get('amount_out_max', '')
        from_date = self.request.GET.get('from_date', '')
        to_date = self.request.GET.get('to_date', '')


        if is_dropdown=='1':
            print("Drop down get request")
            self.serializer_class = TransactionDropdownSerializer

        qs = Transaction.objects.all()

        if username: qs = qs.filter(username=username)
        if product_name: qs = qs.filter(product_name=product_name)
        if transaction_id: qs = qs.filter(transaction_id=transaction_id)

        if from_date:qs = qs.filter(created_at__gte=changing_naive_time(from_date))
        if to_date:qs = qs.filter(created_at__lte=changing_naive_time(to_date))

        if amount_in_min: qs = qs.filter(amount_in__gte=amount_in_min)
        if amount_in_max: qs = qs.filter(amount_in__lte=amount_in_max)

        if amount_out_min: qs = qs.filter(amount_out__gte=amount_out_min)
        if amount_out_max: qs = qs.filter(amount_out__lte=amount_out_max)


        if id: qs = qs.filter(id=id)


        return qs.order_by('-id')

    def post(self, request):
        print("request data ",request.data)
        required = ["transaction_id"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")

        try:
            id = self.request.POST.get("id", "")
            keyword = self.request.POST.get("keyword", "")
            if id:
                return ResponseFunction(0, "Transaction cannot update", {})
                print("Transaction Updating")
                Transaction_qs = Transaction.objects.filter(id=id)
                if not Transaction_qs.count():
                    return ResponseFunction(0, "Transaction Not Found", {})
                transaction_obj = Transaction_qs.first()
                serializer = TransactionSerializer(transaction_obj, data=request.data, partial=True)
                msg = "Data updated"

            else:
                print("Adding new Transaction")
                serializer = TransactionSerializer(data=request.data, partial=True)
                msg = "Data saved"

            serializer.is_valid(raise_exception=True)
            user_id =self.request.POST['user']
            print("User ",user_id)
            user = UserDetails.objects.get(id=user_id)

            if keyword == "withdrawal request":
                print(f"Withdrawal userbalance {user.wallet_balance} , paying amount {self.request.POST['amount_out']}")
                if user.wallet_balance >= float(self.request.POST['amount_out']):
                    user.wallet_balance = float(user.wallet_balance) - float(self.request.POST['amount_out'])
                    user.wallet_withdraw = user.wallet_withdraw + float(self.request.POST['amount_out'])
                else:
                    return ResponseFunction(0,f"Do not have enough funds, Available fund is {user.wallet_balance}",{})
            if keyword == "deposit request":
                print("Deposit")
                user.wallet_balance = float(user.wallet_balance) + float(self.request.POST['amount_in'])
                user.wallet_credited = user.wallet_credited + float(self.request.POST['amount_in'])
            print("User ",user)
            user.save()

            obj = serializer.save(user=user)

            if keyword == "course purchase":
                setBusinessLogic(user_obj = user)

            return ResponseFunction(1, msg, TransactionSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})

    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Transaction.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Transaction.objects.filter(id__in=id).delete()
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


def setBusinessLogic(**kwargs):
    user_obj = kwargs.get('user_obj')
    referal_code_used = user_obj.referal_code_used
    print("Referal code used ",referal_code_used)

    if referal_code_used:
        referer_qs = UserDetails.objects.filter(referal_code=user_obj.referal_code_used)

        if referer_qs.count() > 0:
            referer_obj = referer_qs.first()
            print("Refered User : ",referer_obj.username)
            referer_obj.business_count = referer_obj.business_count + 1
            # referer_obj.business_count = 100 # business count in [0,9,10,19,45,51,100] Test case passed

            if referer_obj.business_count:
                commission_amount = float(SettingsModel.objects.get(field_name="referal_reward").value)
                referer_obj.wallet_credited = float(referer_obj.wallet_credited) + commission_amount
                referer_obj.wallet_balance = float(referer_obj.wallet_balance) + commission_amount
                print(f"Referer Walelt Updated by +{commission_amount} ie Total Balance : ",referer_obj.wallet_credited)

            else:
                print("Didnt meet enough business ",referer_obj.business_count)
            referer_obj.save()
        else:
            print("Referal User Not Fount")
    else:
        print(f"{user_obj.username} NOT USED ANY REFERAL")

    return user_obj
