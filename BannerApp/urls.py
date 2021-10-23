from django.urls import path

from BannerApp import views

urlpatterns = [
    path('',views.BannerAPI.as_view()),

]