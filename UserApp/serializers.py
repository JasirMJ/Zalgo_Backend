from django.contrib.auth.models import User
from rest_framework import serializers

from UserApp.models import UserDetails
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer

#
class UserSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = UserDetails
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class UserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = UserDetails
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

# class UserSerializerWithOutPass(DynamicFieldsModelSerializer):
#     class Meta:
#         model = UserDetails
#         fields="__all__"

class UserDetailsDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = UserDetails
        fields=['id','username']

class UserAppSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = UserDetails
        fields=[
            "id",
            # "password",
            "username",
            "email",
            "is_active",
            "mobile",
            "address_id",
            "address_txt",
            "pin",
            "latitude",
            "longitude",
            "is_blocked",
        ]
