from django.shortcuts import render

# Create your views here.

from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *

import requests
import json

# import checksum generation utility
# You can get this utility from https://developer.paytm.com/docs/checksum/
# import PaytmChecksum
from paytmchecksum import PaytmChecksum

class InitiateTransactionAPI(ListAPIView):

    # authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticatedOrReadOnly,)


    def post(self, request):
        # required = ["name","country_code"]
        # validation_errors = ValidateRequest(required, self.request.data)
        #
        # if len(validation_errors) > 0:
        #     return ResponseFunction(0, validation_errors[0]['error'],{})
        # else:
        #     print("Receved required Fields")


        try:

            msg="initiated "



            paytmParams = dict()


            MerchantID = self.request.POST.get("MerchantID","XEGbPk68721787257649")
            MerchantKey = self.request.POST.get("","hFxAOaR_RPgkR7LZ")
            TXNAmount = self.request.POST['TXNAmount']
            Currency = self.request.POST.get("","INR")
            websiteName = self.request.POST.get("","WEBSTAGING") # or DEFAULT
            orderId = self.request.POST.get("","1234")
            custId = self.request.POST.get("","1234")


            # Website
            # WEBSTAGING
            # Industry Type
            # Retail
            # Channel ID(For Website)
            # WEB
            # Channel ID(For Mobile Apps)
            # WAP

            paytmParams["body"] = {
                "requestType": "Payment",
                "mid": MerchantID,
                "websiteName": websiteName,
                "orderId": orderId,
                "callbackUrl": websiteName,#"https://<callback URL to be used by merchant>",
                "txnAmount": {
                    "value": TXNAmount,
                    "currency": Currency,
                },
                "userInfo": {
                    "custId": custId,
                },
            }

            # Generate checksum by parameters we have in body
            # Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys
            checksum = PaytmChecksum.generateSignature(json.dumps(paytmParams["body"]), MerchantKey)

            paytmParams["head"] = {
                "signature": checksum
            }

            post_data = json.dumps(paytmParams)

            # for Staging
            url = f"https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid={MerchantID}&orderId={orderId}"

            # for Production
            # url = "https://securegw.paytm.in/theia/api/v1/initiateTransaction?mid=YOUR_MID_HERE&orderId=ORDERID_98765"
            response = requests.post(url, data=post_data, headers={"Content-type": "application/json"}).json()
            print("Paytm Initiate Response ",response)
            return ResponseFunction(1, msg, {"request_data":self.request.data,"response":response})
        except Exception as e:
            msg = "Excepction @ InitiateTransactionAPI "+ printLineNo()+ " : "+ str(e)

            return ResponseFunction(0,msg,{})
