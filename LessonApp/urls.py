from django.urls import path

from LessonApp import views

urlpatterns = [
    path('',views.LessonAPI.as_view()),

]