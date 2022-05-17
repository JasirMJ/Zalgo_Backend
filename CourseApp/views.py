from ast import keyword
from django.shortcuts import render

# Create your views here.
from CourseApp.models import *
from CourseApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *
from zalgo_BE.settings import TIME_ZONE



class CourseAPI(ListAPIView):

    serializer_class = CourseSerializer
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
            self.serializer_class = CourseDropdownSerializer

        qs = Course.objects.all()

        if id: qs = qs.filter(id=id)
        if name: qs = qs.filter(name__icontains=name)
        if course_code: qs = qs.filter(course_code=course_code)


        return qs.order_by('-id')

    def post(self, request):
        required = ["name"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")


        try:

            id = self.request.POST.get("id")

            if id:

                print("Course Updating")
                Course_qs = Course.objects.filter(id=id)
                if not Course_qs.count():
                    return ResponseFunction(0, "Course Not Found", {})
                course_obj = Course_qs.first()
                serializer = CourseSerializer(course_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Course")
                serializer = CourseSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save()


            return ResponseFunction(1, msg, CourseSerializer(obj).data)
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
        serializer = CourseSerializer(Course.objects.filter(id=id).first(), data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return ResponseFunction(1, "Data updated",{})


    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                Course.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                Course.objects.filter(id__in=id).delete()
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

class CoursePurchaseHistoryAPI(ListAPIView):

    serializer_class = CoursePurchaseHistorySerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get(self,request):
        print("Request user ",self.request.user)
        #
        # for x in Token.objects.all():
        #     print("user  ",x.user.id,':',x.user," : Token",x.key)

        keyword = self.request.GET.get('keyword','my_course')


        qs = CoursePurchaseHistory.objects.all()

        if keyword == 'my_course':
            qs = qs.filter(user=self.request.user)
            print("My course 1 ",qs)
            qs = qs.values_list('course', flat=True).distinct()
            print("My course 2 ",list(qs))
            return ResponseFunction(1, "Available courses for the user are ", list(qs))
        
        return ResponseFunction(1, "Success", {})

    def post(self, request):
        required = ["user","course","transaction_id","amount"]

        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")


        try:

            id = self.request.POST.get("id")
            user = self.request.POST.get("user",self.request.user.id)
            course = self.request.POST.get("course","")

            dup_qs = CoursePurchaseHistory.objects.filter(Q(user=user)&Q(course=course))
            if dup_qs.count():
                print("Duplicate entry found ")
                print("data : ",self.request.data)
                return ResponseFunction(0, "Duplicate entry", {})

            if user:
                user_qs = UserDetails.objects.filter(id=user)
                if user_qs.count() == 0:
                    return ResponseFunction(0, "User Not Found", {})
                else:
                    user_obj = user_qs.first()
            
            if course:
                course_qs = Course.objects.filter(id=course)
                if  course_qs.count() == 0:
                    return ResponseFunction(0, "Course Not Found", {})
                else:
                    course_obj = course_qs.first()

                

            if id:
                print("Course Purchase History Updating")
                CoursePurchaseHistory_qs = CoursePurchaseHistory.objects.filter(id=id)
                if not CoursePurchaseHistory_qs.count():
                    return ResponseFunction(0, "Course Purchase History Not Found", {})
                course_obj = CoursePurchaseHistory_qs.first()
                serializer = CoursePurchaseHistorySerializer(course_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Course Purchase History")
                serializer = CoursePurchaseHistorySerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save(user=user_obj,course=course_obj)

            return ResponseFunction(1, msg, CoursePurchaseHistorySerializer(obj).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})

class CourseAnalyticsAPI(APIView):
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)
    
    def get(self,request):
        from datetime import datetime,timedelta

        print("Request user ",self.request.user)

        from_date  = self.request.GET.get('from_date',(datetime.now() - timedelta(days=7)).strftime("%Y-%m-%d"))

        
        to_date = self.request.GET.get('to_date',datetime.now().strftime("%Y-%m-%d"))

        # amsterdam_timezone = pytz.timezone(TIME_ZONE)
        # from_date = amsterdam_timezone.localize(datetime.strptime(from_date, '%Y-%m-%d'))
        # to_date = amsterdam_timezone.localize(datetime.strptime(to_date, '%Y-%m-%d'))

        print(from_date)
        print(to_date)
        # qs = CoursePurchaseHistory.objects.all()
        # qs = CoursePurchaseHistory.objects.filter(date_time__range=[from_date,to_date]).select_related('course').select_related('user')
        qs = CoursePurchaseHistory.objects.select_related('course').select_related('user')


        if from_date:
            qs = qs.filter(date_time__gte=from_date+" 00:00:00")

        if to_date:
            qs = qs.filter(date_time__lte=to_date+" 23:59:59")


        

        # total course purchases
        total_course_purchases = qs.count()

        # most course purchased with course name
        most_course_purchased = qs.values('course__name').annotate(total_purchases=Count('course__name')).order_by('-total_purchases')[:1]

        #least course purchased with course name
        least_course_purchased = qs.values('course__name').annotate(total_purchases=Count('course__name')).order_by('total_purchases')[:1]

        # couse purchases by users 
        list_courses = []
        for x in qs.order_by('-date_time'):
            obj = {"user":x.user.id,"date_time":x.date_time,"username":x.user.username,"course":x.course.id,"course_name":x.course.name}
            list_courses.append(obj)

        data = {}

        data['total_course_purchases'] = total_course_purchases
        data['most_course_purchased'] = most_course_purchased
        data['least_course_purchased'] = least_course_purchased
        data['course_purchases_by_users'] = list_courses

        return ResponseFunction(1, "Success", data)