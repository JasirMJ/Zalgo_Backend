from django.urls import path

from PaytmApp import views

urlpatterns = [
    path('initiate-transaction/',views.InitiateTransactionAPI.as_view()),
    path('transaction-status/',views.TransactionStatusAPI.as_view()),
    path('callback/',views.CallBackURLAPI.as_view()),

]