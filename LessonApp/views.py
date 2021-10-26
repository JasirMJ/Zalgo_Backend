from django.shortcuts import render

# Create your views here.
from CourseApp.models import Course
from LessonApp.models import *
from LessonApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *



class LessonAPI(ListAPIView):

    serializer_class = LessonSerializer
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
        lesson_code = self.request.GET.get('lesson_code','')
        course = self.request.GET.get('course', '')

        if is_dropdown=='1':
            print("Drop down get request")
            self.serializer_class = LessonDropdownSerializer

        qs = Lesson.objects.all()

        if id: qs = qs.filter(id=id)
        if name: qs = qs.filter(name__icontains=name)
        if lesson_code: qs = qs.filter(lesson_code=lesson_code)


        if course: qs = Course.objects.get(id=course).lessons.all()

        return qs

    def post(self, request):
        required = ["name","course"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")

        try:
            id = self.request.POST.get("id", "")
            course = self.request.POST.get("course", "")
            course_obj = None
            if course:
                course_qs = Course.objects.filter(id=course)
                if course_qs.count():
                    course_obj = course_qs.first()
                else:
                    return ResponseFunction(0,"Course not found",{})

            if id:

                print("Lesson Updating")
                Lesson_qs = Lesson.objects.filter(id=id)
                if not Lesson_qs.count():
                    return ResponseFunction(0, "Lesson Not Found", {})
                lesson_obj = Lesson_qs.first()
                serializer = LessonSerializer(lesson_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Lesson")
                serializer = LessonSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save()
            course_obj.lessons.add(obj)

            return ResponseFunction(1, msg, LessonSerializer(obj).data)
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
        serializer = LessonSerializer(Lesson.objects.filter(id=id).first(), data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return ResponseFunction(1, "Data updated",{})


    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Lesson.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Lesson.objects.filter(id__in=id).delete()
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

