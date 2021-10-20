from django.urls import path

from RequestsApp import views

urlpatterns = [
    path('',views.RequestModelAPI.as_view()),

]