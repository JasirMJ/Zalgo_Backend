from LessonApp.serializers import LessonSerializer
from UserApp.serializers import UserSerializer
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from CourseApp.models import *



class CourseUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Course
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class CourseSerializer(DynamicFieldsModelSerializer):
    lessons = LessonSerializer(many=True)
    class Meta:
        model = Course
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class CourseDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Course
        fields = ["id", "name","course_fee"]


class CoursePurchaseHistorySerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = CoursePurchaseHistory
        fields = "__all__"
