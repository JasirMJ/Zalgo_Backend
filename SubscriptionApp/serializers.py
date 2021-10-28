from UserApp.serializers import UserSerializer
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from TopicApp.models import *



class TopicUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Topic
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class TopicSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Topic
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class TopicDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Topic
        fields = ["id", "name"]



