from django.urls import path

from CourseApp import views

urlpatterns = [
    path('',views.CourseAPI.as_view()),
    path('my-courses/',views.CoursePurchaseHistoryAPI.as_view()),
    path('course-analytics/',views.CourseAnalyticsAPI.as_view()),

]