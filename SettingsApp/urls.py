from django.urls import path

from SettingsApp import views

urlpatterns = [
    path('',views.SettingsAPI.as_view()),

]