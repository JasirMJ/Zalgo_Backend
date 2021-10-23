
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from NotificationApp.models import *


class NotificationSerializer(DynamicFieldsModelSerializer):

    class Meta:
        model = Notification
        fields="__all__"

class NotificationAppSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Notification
        fields = ["id","name", "file","type"]


class NotificationDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Notification
        fields = ["id", "name"]
        # fields="__all__"


