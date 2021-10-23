
from zalgo_BE.DynamicFieldsModel import DynamicFieldsModelSerializer
from BannerApp.models import *


class BannerSerializer(DynamicFieldsModelSerializer):

    class Meta:
        model = Banner
        fields="__all__"

class BannerAppSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Banner
        fields = ["id","name", "file","type"]


class BannerDropdownSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Banner
        fields = ["id", "name"]
        # fields="__all__"


