from UserApp.serializers import UserSerializer
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from PartnersApp.models import *



class PartnersUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Partners
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class PartnersSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Partners
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class PartnersDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Partners
        fields = ["id", "name"]



