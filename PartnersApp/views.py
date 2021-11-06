from django.shortcuts import render

# Create your views here.
from LessonApp.models import Lesson
from PartnersApp.models import *
from PartnersApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class PartnersAPI(ListAPIView):

    serializer_class = PartnersSerializer
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
            self.serializer_class = PartnersDropdownSerializer

        qs = Partners.objects.all()

        if id: qs = qs.filter(id=id)
        if name: qs = qs.filter(name__icontains=name)
        if topic_code: qs = qs.filter(topic_code=topic_code)

        return qs.order_by('-id')

    def post(self, request):
        required = ["name"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")


        try:

            id = self.request.POST.get("id", "")
            user = self.request.POST.get("user", "")
            user_obj = None
            if user:
                user_qs = UserDetails.objects.filter(id=user)
                if user_qs.count():
                    user_obj = user_qs.first()
                else:
                    return ResponseFunction(0, "Course not found", {})


            if id:

                print("Partners Updating")
                Partners_qs = Partners.objects.filter(id=id)
                if not Partners_qs.count():
                    return ResponseFunction(0, "Partners Not Found", {})
                transaction_obj = Partners_qs.first()
                serializer = PartnersSerializer(transaction_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Partners")
                serializer = PartnersSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            if user:
                obj = serializer.save(user=user_obj)
            else:
                obj = serializer.save()

            return ResponseFunction(1, msg, PartnersSerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})

    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Partners.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Partners.objects.filter(id__in=id).delete()
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

