
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from ProductApp.models import *



class ProductUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = UserDetails
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class ProductSerializer(DynamicFieldsModelSerializer):
    # user = ProductUserDetailsSerializer()
    class Meta:
        model = Product
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"


class ProductDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Product
        fields = ["id", "name"]


class SubProductSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = SubProduct
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

