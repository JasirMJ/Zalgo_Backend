from django.shortcuts import render

# Create your views here.
from SettingsApp.models import *
from SettingsApp.serializers import SettingsSerializer
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *

settings_list = [
    # SettingsModel(data_type="NUMBER",field_name='contact_24x7',value="7987995846",description="Customer support 24x7",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='Dollar Price',value="75",description="Update dollar price daily to convert payments with the multiple of dollar price",is_active=1),

    SettingsModel(data_type="NUMBER",field_name='crypto queries',value="917907960873",description="Whatsapp number of Crypto queries",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='stock queries',value="917907960873",description="Whatsapp number of Stock queries",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='forex queries',value="917907960873",description="Whatsapp number of Forex queries",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='join_our_community queries',value="917907960873",description="Whatsapp number of join community queries",is_active=1),

    SettingsModel(data_type="TEXT",field_name='crypto URL',value="https://www.google.com",description="URL for crypto",is_active=1),
    SettingsModel(data_type="TEXT",field_name='stock URL',value="https://www.google.com",description="URL for stock",is_active=1),
    SettingsModel(data_type="TEXT",field_name='forex URL',value="https://www.google.com",description="URL for forex",is_active=1),

    # SettingsModel(data_type="TEXT", field_name='join_community URL', value="https://www.google.com",
    #               description="URL to join community", is_active=1),

    SettingsModel(data_type="NUMBER",field_name='Free trail periods in days',value="14",description="Free trail periods for product and services",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='Subscription priods in days',value="30",description="Subscripton periods for product and services",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='Subscription renewal option in days',value="30",description="Subscription renewal option display with in the specified days of expiry",is_active=1),

    SettingsModel(data_type="NUMBER",field_name='VIP 1 %',value="5",description="Percentage of commission value for VIP 1",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='VIP 2 %',value="10",description="Percentage of commission value for VIP 2",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='VIP 3 %',value="15",description="Percentage of commission value for VIP 3",is_active=1),
    SettingsModel(data_type="NUMBER",field_name='VIP 4 %',value="20",description="Percentage of commission value for VIP 4",is_active=1),

    SettingsModel(data_type="NUMBER",field_name='referal_reward',value="500",description="Commission amount on each course purchase",is_active=1),

    SettingsModel(data_type="BOOLEAN",field_name='IB change option',value="true",description="if its true then IB change option will be shown in app",is_active=1),

    # SettingsModel(data_type="FILE",field_name='Brocker Image',value="true", file=None,description="Brockage Image",is_active=1),

    SettingsModel(data_type="TEXT",field_name='URL Terms and condition',value="https://www.google.com/",description="URL for terms and condition",is_active=1),
    SettingsModel(data_type="TEXT",field_name='URL Privacy policy',value="https://www.google.com/",description="URL for privacy policy",is_active=1),

    SettingsModel(data_type="TEXT",field_name='Razorpay API Key',value="rzp_test_bGi2cqJhwKKzT1",description="Razorpay key for online payments",is_active=1),
    SettingsModel(data_type="TEXT",field_name='Razorpay Secret API Key',value="7FekPaDihsgYNAk8WfgNuhxH",description="Razorpay Secret key for REST API's",is_active=1),
    SettingsModel(data_type="TEXT",field_name='Google API Key',value="7FekPaDihsgYNAk8WfgNuhxH",description="Google API key, for google services",is_active=1),

    # SettingsModel(data_type="TEXT",field_name='extra_charge_description',value="Due to heavy rain",description="Extra charge description",is_active=1),
    # SettingsModel(data_type="BOOLEAN",field_name='prescription_box',value="true",description="if its true then prescription box will be enabled",is_active=1),
    # SettingsModel(data_type="ARRAY",field_name='prescription_box_pin',value="679321,145512,512341",description="prescription box will be available at specified pin codes only",is_active=1),

    SettingsModel(data_type="TEXT", field_name='onesignal_app_id', value="8b97c9bb-8bd0-47cd-baec-05eee09b5cd6",
                  description="Used to send notification to the users", is_active=1),



    SettingsModel(data_type="TEXT", field_name='onesignal_rest_api_key',
                  value="ZThhZGZmOTQtMzE1ZC00MjNkLThhOGMtYzA3YTJjNjk1YzM0",
                  description="Used to send notification to the users", is_active=1),

    SettingsModel(data_type="TEXT", field_name='min_app_version', value="1.0.0",
                  description="App will block if the app version below mentioned, format must be is X.X.X", is_active=1),



    SettingsModel(data_type="BOOLEAN",field_name='paytm_live_mode',value="true",description="if its true then paytm works as production else staging",is_active=1),
    SettingsModel(data_type="TEXT", field_name='paytm_merchant_id', value="vkYTGo14972197487927", description="Paytm MerchantID", is_active=1),
    SettingsModel(data_type="TEXT", field_name='paytm_merchant_key', value="uoV3oypKJ1en6TOe", description="Paytm Merchant Key", is_active=1),

]



def defaultSettings(snapshot):
    # NUMBER, TEXT, BOOLEAN, DATE, TIME, DATETIME

    new_settings = []
    for settings in settings_list:
        found = 0
        for snap in snapshot:
            if snap.field_name==settings.field_name:
                found = 1
                new_settings.append(snap)
                # print("added old ", snap.field_name)
        if not found:
            # print("added new ",settings.field_name)
            new_settings.append(settings)

    # print("New items added ",len(new_settings))
    SettingsModel.objects.bulk_create(new_settings)
    return 1

class SettingsAPI(ListAPIView):

    serializer_class = SettingsSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get_queryset(self):

        pagination = self.request.GET.get('pagination', '1')
        if pagination == '0':
            # print("Pagination None")
            self.pagination_class = None

        # SettingsModel.objects.all().delete()
        field_name_list =json.loads(self.request.GET.get('field_name_list', "[]"))

        queryset = SettingsModel.objects.all()
        # return queryset
        # print("QS Count ",queryset.count())
        # print("Static list  Count ",len(settings_list))
        if queryset.count() != len(settings_list):
            # print("Settings list count mismatch refreshing settings")
            snapshot = []

            for settings in SettingsModel.objects.all():
                snapshot.append(SettingsModel(field_name=settings.field_name,value=settings.value,description=settings.description,data_type=settings.data_type,is_active=settings.is_active))

            SettingsModel.objects.all().delete()
            defaultSettings(snapshot)
        else:
            print("Settings are uptodate")
        qs = SettingsModel.objects.all()
        # print("Settings Updated")

        if len(field_name_list):
            # print("field_name list ")
            qs = qs.filter(field_name__in=field_name_list)

        return qs.order_by("field_name")

    def post(self, request):
        # print("data ",self.request.data)
        required = ["field_name","value"]
        validation_errors = ValidateRequest(required, self.request.data)

        if len(validation_errors) > 0:
            return ResponseFunction(0, validation_errors[0]['error'],{})
        else:
            print("Receved required Fields")


        try:
            # print(self.request.POST.get("name",""))
            # serializer = SettingsSerializer(data=request.data)
            # serializer.is_valid(raise_exception=True)
            # obj = serializer.save()
            # msg = "Data saved "
            id = self.request.POST.get("id", "")

            if id:
                print("Settings Updating")

                _qs = SettingsModel.objects.filter(id=id)
                if not _qs.count():
                    return ResponseFunction(0, "Settings Not Found", {})
                _obj = _qs.first()
                serializer = SettingsSerializer(_obj, data=request.data, partial=True)
                msg = "Data updated"
            else:
                print("Adding new Settings")
                serializer = SettingsSerializer(data=request.data, partial=True)
                msg = "Data saved"
            serializer.is_valid(raise_exception=True)

            obj = serializer.save()
            # print("Data id or object : ", obj.id)
            return ResponseFunction(1,msg,SettingsSerializer(SettingsModel.objects.all().order_by("-id"),many=True).data)
        except Exception as e:
            printLineNo()

            print("Excepction ", printLineNo(), " : ", e)
            # print("Excepction ",type(e))

            return ResponseFunction(0,f"Excepction occured {str(e)}",{})

    def put(self, request):

        ResponseFunction(0,"Not enabled",{})

        id = self.request.POST.get("id")
        if not id or id == "":
            return Response({
                STATUS: False,
                MESSAGE: "Required object id as id"
            })
        serializer = SettingsSerializer(SettingsModel.objects.filter(id=id).first(), data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return ResponseFunction(1, "Data updated",{})

    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":

                SettingsModel.objects.all().delete()
                return ResponseFunction(1, "Deleted all data",{})

            else:
                id = json.loads(id)
                # print(id)
                SettingsModel.objects.filter(id__in=id).delete()
                return ResponseFunction(1, "Deleted data having id " + str(id),{})

        except Exception as e:
            printLineNo()

            return Response(
                {
                    STATUS: False,
                    MESSAGE: str(e),
                    "line_no": printLineNo()
                }
            )


