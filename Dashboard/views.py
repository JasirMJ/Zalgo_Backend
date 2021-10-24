from django.shortcuts import render

from BannerApp.models import Banner
from BannerApp.serializers import BannerSerializer
from ProductApp.models import Product
from ProductApp.serializers import ProductSerializer
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *

# Create your views here.
class UserAppDashboardAPI(APIView):
    def get(self,request):
        try:
            data = {}

            data['banners']=BannerSerializer(Banner.objects.filter(is_broker_image=0),many=True).data
            data['broker_image']=BannerSerializer(Banner.objects.filter(is_broker_image=1),many=True).data
            # print(data['banners'])
            data['products']=ProductSerializer(Product.objects.filter(is_product=1),many=True).data
            # print(data['products'])
            data['service']=ProductSerializer(Product.objects.filter(is_service=1),many=True).data
            # print(data['service'])
            return ResponseFunction(1,"UserApp Dashboard data",data)
        except Exception as e:
            print("Exception Occured ",e)
            return ResponseFunction(0,f"Exception occured {str(e)} at Line {printLineNo()}",)