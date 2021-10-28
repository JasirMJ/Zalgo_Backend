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
    class Meta:
        model = Subscription
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class SubscriptionDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Subscription
        fields = ["id", "name"]



