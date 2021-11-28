from rest_framework import serializers

from SettingsApp.models import SettingsModel
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from ProductApp.models import *



class ProductUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = UserDetails
        fields=["id","username","email","mobile",]

class SubProductSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = SubProduct
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class SubProductMinSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = SubProduct
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = ["id","name","price"]


class ProductSerializer(DynamicFieldsModelSerializer):
    sub_product = SubProductSerializer(many=True)
    class Meta:
        model = Product
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"


class ProductDropdownSerializer(DynamicFieldsModelSerializer):
    sub_product = SubProductMinSerializer(many=True)
    class Meta:
        model = Product
        fields = ["id","name","price","sub_product"]



