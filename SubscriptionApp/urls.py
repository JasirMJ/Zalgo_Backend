from django.urls import path

from SubscriptionApp import views

urlpatterns = [
    path('',views.SubscriptionAPI.as_view()),

]