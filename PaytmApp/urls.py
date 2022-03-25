from django.urls import path

from PaytmApp import views

urlpatterns = [
    path('initiate-transaction/',views.InitiateTransactionAPI.as_view()),

]