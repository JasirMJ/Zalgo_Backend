"""zalgo_BE URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import include

from django.conf import settings
from django.conf.urls.static import static

from Dashboard.views import UserAppDashboardAPI, GradeAPI

urlpatterns = [
    path('admin/', admin.site.urls),
    path('users/', include('UserApp.urls')),
    path('settings/', include('SettingsApp.urls')),
    path('country/', include('CountryApp.urls')),
    path('requests/', include('RequestsApp.urls')),
    path('product/', include('ProductApp.urls')),
    path('banners/', include('BannerApp.urls')),
    path('course/', include('CourseApp.urls')),
    path('lesson/', include('LessonApp.urls')),
    path('topic/', include('TopicApp.urls')),
    path('notifications/', include('NotificationApp.urls')),
    path('subscriptions/', include('SubscriptionApp.urls')),
    path('transactions/', include('TransactionApp.urls')),
    path('partners/', include('PartnersApp.urls')),
    path('zalgo-accounts/', include('ZalgoAccountApp.urls')),
    path('dashboard-userapp/', UserAppDashboardAPI.as_view()),
    path('dashboard-grade/', GradeAPI.as_view()),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,document_root=settings.STATIC_URL)
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)