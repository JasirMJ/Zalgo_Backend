from UserApp.serializers import UserSerializer
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from ZalgoAccountApp.models import *



class ZalgoAccountUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = ZalgoAccount
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class ZalgoAccountSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = ZalgoAccount
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class ZalgoAccountDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = ZalgoAccount
        fields = ["id", "name"]



