
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from RequestsApp.models import *



class RequestUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = UserDetails
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class RequestModelSerializer(DynamicFieldsModelSerializer):
    user = RequestUserDetailsSerializer()
    class Meta:
        model = RequestModel
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class RequestModelDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = RequestModel
        fields = ["id", "name"]



