from rest_framework import serializers

from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from NotificationApp.models import *


class NotificationSerializer(DynamicFieldsModelSerializer):
    read = serializers.SerializerMethodField()
    class Meta:
        model = Notification
        fields="__all__"
    def get_read(self,obj):
        read_qs = UserNotificationStatus.objects.filter(notification_id=obj.id)
        if read_qs.count() > 0:
            return 1
        else:
            return 0
class NotificationAppSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Notification
        fields = ["id","name", "file","type"]


class NotificationDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Notification
        fields = ["id", "name"]
        # fields="__all__"


