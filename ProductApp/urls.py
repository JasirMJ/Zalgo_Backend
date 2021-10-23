from django.urls import path

from ProductApp import views

urlpatterns = [
    path('',views.ProductAPI.as_view()),
    path('variants/', views.SubProductAPI.as_view()),

]