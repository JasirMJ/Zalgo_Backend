from django.urls import path

from TransactionApp import views

urlpatterns = [
    path('',views.TransactionAPI.as_view()),

]