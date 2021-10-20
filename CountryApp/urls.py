from django.urls import path

from CountryApp import views

urlpatterns = [
    path('',views.CountryAPI.as_view()),

]