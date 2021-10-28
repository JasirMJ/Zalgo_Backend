from django.urls import path

from TopicApp import views

urlpatterns = [
    path('',views.TopicAPI.as_view()),

]