from django.urls import path

from NotificationApp import views

urlpatterns = [
    path('',views.NotificationAPI.as_view()),

]