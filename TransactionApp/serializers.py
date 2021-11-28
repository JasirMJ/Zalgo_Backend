from UserApp.serializers import UserSerializer
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from TransactionApp.models import *



class TransactionUserDetailsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Transaction
        fields=[
            "id",
            "username",
            "email",
            "mobile",
        ]


class TransactionSerializer(DynamicFieldsModelSerializer):

    class Meta:
        model = Transaction
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"

class TransactionDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Transaction
        fields = ["id", "name"]



