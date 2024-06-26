from rest_framework import serializers

from TopicApp.serializers import TopicSerializer
from UserApp.serializers import UserSerializer
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from LessonApp.models import *



class LessonUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Lesson
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class LessonSerializer(DynamicFieldsModelSerializer):
    topic = TopicSerializer(many=True)
    class Meta:
        model = Lesson
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class LessonDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Lesson
        fields = ["id", "name"]



