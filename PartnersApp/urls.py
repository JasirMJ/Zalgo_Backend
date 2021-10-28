from django.urls import path

from PartnersApp import views

urlpatterns = [
    path('',views.PartnersAPI.as_view()),

]