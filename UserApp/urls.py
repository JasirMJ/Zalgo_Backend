from django.urls import path

from UserApp import views

urlpatterns = [
    path('',views.UserAPI.as_view()),
    path('login/',views.LoginView.as_view()),
    path('change-password/', views.ChangePassword.as_view()),
    path('generate-otp/', views.GenerateOTP.as_view()),
    path('verify-otp/', views.OTPVerification.as_view()),
]