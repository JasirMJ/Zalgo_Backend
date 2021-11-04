from django.shortcuts import render

# Create your views here.
from LessonApp.models import Lesson
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
        name = self.request.GET.get('name','')
        topic_code = self.request.GET.get('topic_code','')

        if is_dropdown=='1':
            print("Drop down get request")
            self.serializer_class = TransactionDropdownSerializer

        qs = Transaction.objects.all()

        if id: qs = qs.filter(id=id)
        if name: qs = qs.filter(name__icontains=name)
        if topic_code: qs = qs.filter(topic_code=topic_code)

        return qs

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


            if id:

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

            obj = serializer.save(user=self.request.user)

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

