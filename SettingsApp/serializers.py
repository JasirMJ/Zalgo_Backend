
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from SettingsApp.models import *

class SettingsSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = SettingsModel
        # fields = ["mobile_number", "whatsapp_number", "is_customer", "is_staff"]
        fields = "__all__"


