from django.shortcuts import render

# Create your views here.
from LessonApp.models import Lesson
from TopicApp.models import *
from TopicApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class TopicAPI(ListAPIView):

    serializer_class = TopicSerializer
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
            self.serializer_class = TopicDropdownSerializer

        qs = Topic.objects.all()

        if id: qs = qs.filter(id=id)
        if name: qs = qs.filter(name__icontains=name)
        if topic_code: qs = qs.filter(topic_code=topic_code)

        return qs

    def post(self, request):
        required = ["name","lesson"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")


        try:

            id = self.request.POST.get("id", "")
            lesson = self.request.POST.get("lesson", "")
            lesson_obj = None
            if lesson:
                lesson_qs = Lesson.objects.filter(id=lesson)
                if lesson_qs.count():
                    lesson_obj = lesson_qs.first()
                else:
                    return ResponseFunction(0,"Lesson not found",{})

            if id:

                print("Topic Updating")
                Topic_qs = Topic.objects.filter(id=id)
                if not Topic_qs.count():
                    return ResponseFunction(0, "Topic Not Found", {})
                topic_obj = Topic_qs.first()
                serializer = TopicSerializer(topic_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Topic")
                serializer = TopicSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save()
            lesson_obj.topic.add(obj)

            return ResponseFunction(1, msg, TopicSerializer(obj).data)
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
        serializer = TopicSerializer(Topic.objects.filter(id=id).first(), data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return ResponseFunction(1, "Data updated",{})


    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Topic.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Topic.objects.filter(id__in=id).delete()
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

