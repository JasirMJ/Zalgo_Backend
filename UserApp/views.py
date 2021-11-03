from django.contrib.auth.models import User
from django.shortcuts import render
from django.utils.crypto import get_random_string

from UserApp.models import *
from UserApp.serializers import *
from zalgo_BE.GlobalFunctions import *
from zalgo_BE.GlobalImports import *

class UserAPI(ListAPIView):
    serializer_class = UserSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (AllowAny,)


    def get_queryset(self):
        print("Get UserAPI")



        #serializer change -start
        is_dropdown = self.request.GET.get('is_dropdown', '0')
        is_user_app = self.request.GET.get('is_user_app', '0')

        #serializer change filters
        if is_user_app=='1':
            self.serializer_class = UserAppSerializer
        if is_dropdown=='1':
            self.serializer_class = UserDetailsDropdownSerializer
        # serializer change -end

        id = self.request.GET.get('id','')
        mobile = self.request.GET.get('mobile','')
        username = self.request.GET.get('username','')
        is_blocked = self.request.GET.get('is_blocked','')
        referal_code = self.request.GET.get('referal_code','')

        if not self.request.user.is_superuser:
            print("Request not from superuser, then he get his own data only and null for anonimous users")

            return UserDetails.objects.filter(username=self.request.user.username)


        qs = UserDetails.objects.all()

        if id:qs = qs.filter(id=id)
        if mobile:qs = qs.filter(mobile=mobile)
        if username:qs = qs.filter(username__icontains=username)
        if is_blocked:qs = qs.filter(is_blocked=is_blocked)
        if referal_code:
            qs = qs.filter(referal_code_used=referal_code)
            print("qs ", qs)
            return qs

        return qs

    def post(self, request):
        user_obj = ""
        print("Receved User data ",self.request.data)
        # mobile
        # address
        # pin
        # latitude
        # longitude
        required = ["username","mobile"]
        validation_errors = ValidateRequest(required,self.request.data)

        if len(validation_errors)>0:
            return ResponseFunction(0,validation_errors[0]['error'],{})
        else:
            print("Received required Fields")


        try:
            id = self.request.POST.get("id", "")
            if id:
                user_qs = UserDetails.objects.filter(id=id)
                if not user_qs.count():
                    return ResponseFunction(0, "UserDetails Not Found",{})
                print("UserDetails Updating")
                msg = "Data updated"
                serializer = UserSerializer(user_qs.first(),data=request.data,partial=True)
                serializer.is_valid(raise_exception=True)

                password = self.request.POST.get('password','')
                if password :
                    msg="User details and password updated"
                    user_obj = serializer.save(password=make_password(password))
                else:
                    msg="User details updated"

                    user_obj = serializer.save()
            else:
                referal_code_used = self.request.POST.get('referal_code_used','')
                _qs = None
                _obj = None
                if referal_code_used:
                    _qs = UserDetails.objects.filter(referal_code=referal_code_used)
                    print("User qs Referal code ",_qs)
                    if _qs.count():
                        _obj = _qs.first()
                        print(f"used referal_code of {_obj.username}")
                    else:
                        print("Invalid Referal Code")
                        return ResponseFunction(0,"Invalid Referal Code, They are case sensitive and must be entered exactly as they are",{})

                print("Adding new UserDetails")
                serializer = UserSerializer(data=request.data, partial=True)
                serializer.is_valid(raise_exception=True)
                msg = "Data saved"
                msg = "Created New User"


                if _obj:
                    _obj.referred_count =_obj.referred_count+1
                    user_obj = serializer.save(referal_code=GenerateReferalCode(),
                                               referal_user=_obj.username,
                                               referal_code_used=referal_code_used,
                                               password=make_password('AYD@' + self.request.data['mobile']))
                    _obj.save()

                else:
                    user_obj = serializer.save(referal_code=GenerateReferalCode(),
                                               password=make_password('AYD@' + self.request.data['mobile']))


            token, created = Token.objects.get_or_create(user=user_obj)
            # return ResponseFunction(1, msg,{})
            return ResponseFunction(True,msg,{"id": user_obj.id,"username": user_obj.username,"player_id": user_obj.player_id,"mobile": user_obj.mobile,"token":"Token "+str(token)})
        except Exception as e:
            print(f"Excepction occured {e} error at {printLineNo()}")

            if user_obj:
                user_obj.delete()

            return ResponseFunction(0, str(e),{})

    def put(self,request):
        msg = ""
        id = self.request.POST.get("id","")
        keyword = self.request.POST.get("keyword","")
        print("Keyword ",keyword)
        try:
            if keyword == "admin":
                exclude_list = ["id",]
                validation_errors = excludeValidation(exclude_list, self.request.data)
                if len(validation_errors) > 0:
                    return ResponseFunction(0, validation_errors[0]['error'],{})
                serializer = UserSerializer(self.request.user, data=request.data, partial=True)
                serializer.is_valid(raise_exception=True)
                user_obj = serializer.save()
                return ResponseFunction(1, "Admin Data updated")
            else:
                required = ["id", "username","mobile"]
                validation_errors = ValidateRequest(required, self.request.data)

                if len(validation_errors) > 0:
                    return ResponseFunction(0, validation_errors[0]['error'],{})
                else:
                    print("Receved required Fields")

                user_qs = UserDetails.objects.filter(id=id)
                if user_qs.count() == 0:
                    return ResponseFunction(0, "User not found",{})

                myusr_obj = user_qs.first()

                serializer = UserSerializer(myusr_obj,data=request.data, partial=True)
                serializer.is_valid(raise_exception=True)
                user_obj = serializer.save()

        except Exception as e:
            print(f"Excepction occured {e} error at {printLineNo()}")

            return Response({
                STATUS: 0,
                MESSAGE: str(e),
                "line_no": printLineNo()
            })

        try:
            if myusr_obj.count() == 0:
                #if the User details is empty, then create new record
                # return ResponseFunction(0, "user Details not found")
                serializer = UserDetailsSerializer(data=self.request.data, partial=True)
                serializer.is_valid(raise_exception=True)
                details_obj = serializer.save(user=user_obj)
            else:
                #update existing user details
                serializer = UserDetailsSerializer(myusr_obj.first(), data=self.request.data, partial=True)
                serializer.is_valid(raise_exception=True)
                details_obj = serializer.save()

            # print("User details added : ", details_obj.id)

            msg = f"Data updated "
            return Response({
                STATUS: True,
                MESSAGE: msg,
                "id":user_obj.id,
                "username":user_obj.username,
            })
            # return ResponseFunction(1, msg)

        except Exception as e:
            return ResponseFunction(0, f"Excepction Occured at Line {printLineNo()} : {str(e)}",{})

    def delete(self, request):
        try:
            id = self.request.GET.get('id', "[]")
            if id == "all":
                UserDetails.objects.all().delete()
                return ResponseFunction(1, "Deleted all data")
            else:
                id = json.loads(id)
                # print(id)
                UserDetails.objects.filter(id__in=id).delete()
                return ResponseFunction(1, "Deleted data having id " + str(id))

        except Exception as e:
            print(f"Excepction occured {e} error at {printLineNo()}")

            return Response(
                {
                    STATUS: False,
                    MESSAGE: str(e),
                    "line_no": printLineNo()
                }
            )


class LoginView(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        required = ["username","password"]
        validation_errors = ValidateRequest(required,self.request.data)

        if len(validation_errors)>0:
            return ResponseFunction(0,validation_errors[0]['error'])
        else:
            print("Receved required Fields",request.data)


        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        # print(serializer)
        try:
            test = serializer.is_valid(raise_exception=True)
            user = serializer.validated_data['user']


            token, created = Token.objects.get_or_create(user=user)
            return Response({
                STATUS:True,
                'token': "Token "+token.key,
                'user_id': user.pk,
                'username': user.username,
                'is_superuser':user.is_superuser,
            })
        except Exception as e:
            return Response({
                STATUS:False,
                MESSAGE:"Incorrect Username or Password",
                "excepction":str(e),
            })


class ChangePassword(ListAPIView):
    permission_classes = (IsAuthenticated,)
    authentication_classes = (TokenAuthentication,)

    def post(self, request):
        username = self.request.user.username
        id = self.request.user.id
        old_pass = self.request.POST.get('old_pass')
        new_pass = self.request.POST.get('new_pass')

        if old_pass == "" or not old_pass:
            msg = "required old_pass"
            return Response(
                {
                    MESSAGE: msg,
                    STATUS: False,
                }
            )

        if new_pass == "" or not new_pass:
            msg = "required new_pass"
            return Response(
                {
                    MESSAGE: msg,
                    STATUS: False,
                }
            )

        usr_obj = UserDetails.objects.filter(id=id).first()

        if check_password(old_pass, usr_obj.password):
            usr_obj.password = make_password(new_pass)
            usr_obj.save()
            # django_logout(request)
            return ResponseFunction(1, "Password changed")
        else:
            return ResponseFunction(0, "Password do not match")



class GenerateOTP(ListAPIView):
    authentication_classes = (TokenAuthentication,)
    permission_classes = (AllowAny,)

    def post(self, request):
        try:
            mobile = "91"+request.POST["mobile"]
            print("request accepted")
            resp = True
            # resp = generateOTP(mobile)
            # otpobj = sendotp.sendotp('181599AkdEJBCjhfnW6044a474P1', 'my message is {{otp}} keep otp with you.')
            # print(otpobj.send(mobile, 'msgind', 3245))
            print("otp generated")

            # resp = True

            if resp == True:
                return ResponseFunction(1, "OTP Send",{})
            else:
                return ResponseFunction(1, "Failed to send OTP",{})

        except Exception as e:
            printLineNo()
            return Response(
                {
                    STATUS: False,
                    MESSAGE: str(e),
                    "line_no": printLineNo()
                }
            )

class OTPVerification(ListAPIView):
    authentication_classes = (TokenAuthentication,)
    permission_classes = (AllowAny,)

    def post(self, request):
        try:
            mobile = request.POST["mobile"]
            otp = request.POST["otp"]
            print("request accepted")
            # resp = validateOTP(mobile,otp)
            print("otp generated")
            resp = True

            if resp == True:
                user_qs = UserDetails.objects.filter(mobile=mobile)
                if user_qs.count():
                    user_obj = user_qs.first()
                    username = user_obj.username
                    email = user_obj.email

                    token, created = Token.objects.get_or_create(user=user_obj)
                    print("Token ",token)
                    return ResponseFunction(1, "OTP verified",{"id":user_obj.id,"username":username,"email":email,"token":"Token "+str(token)})
                else:
                    return ResponseFunction(1, "OTP verified", {})
            else:
                return ResponseFunction(0, "Failed to verify OTP")

        except Exception as e:
            printLineNo()
            return Response(
                {
                    STATUS: False,
                    MESSAGE: str(e),
                    "line_no": printLineNo()
                }
            )


def GenerateReferalCode():
    referal_code = get_random_string(5)
    user_qs = UserDetails.objects.filter(referal_code__iexact=referal_code)

    if user_qs.count() > 0:
        print("Referal code regenerating ", referal_code)
        GenerateReferalCode()
    else:
        print("Referal code created ",referal_code)
        return referal_code