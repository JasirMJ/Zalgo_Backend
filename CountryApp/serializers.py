from UserApp.serializers import UserSerializer
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from CountryApp.models import *



class CountryUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Country
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class CountrySerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Country
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class CountryDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Country
        fields = ["id", "name"]



