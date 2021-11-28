from rest_framework import serializers

from UserApp.serializers import UserSerializer
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from SubscriptionApp.models import *



class SubscriptionUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Subscription
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class SubscriptionSerializer(DynamicFieldsModelSerializer):
    product_details = serializers.SerializerMethodField()
    class Meta:
        model = Subscription
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"
    def get_product_details(self,obj):
        # pdt = obj.product.file if obj.product.file else ""
        pdt_data = {}
        if obj.product:
            sub_qs = obj.sub_product
            print("sub_qs : ",sub_qs)
            if sub_qs:
                sub_obj = sub_qs
                pdt_data['id'] = sub_obj.id
                pdt_data['name'] = sub_obj.name
                pdt_data['image'] = sub_obj.file.url
            else:
                pdt_data['id'] = obj.product.id
                pdt_data['name'] = obj.product.name
                pdt_data['image'] = obj.product.file.url

            print(obj.product.file)
            # return "pdt"
            return pdt_data
        else:
            return {}

class SubscriptionDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Subscription
        fields = ["id", "name"]



