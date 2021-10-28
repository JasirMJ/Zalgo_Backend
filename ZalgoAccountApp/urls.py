from django.urls import path

from ZalgoAccountApp import views

urlpatterns = [
    path('',views.ZalgoAccountAPI.as_view()),

]