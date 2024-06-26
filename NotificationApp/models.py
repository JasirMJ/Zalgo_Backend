from django.db import models

# Create your models here.
from UserApp.models import UserDetails


class Notification(models.Model):
    name = models.CharField(max_length=255,null=False, blank=True)
    # type = models.CharField(max_length=255,null=True, blank=True)
    description = models.TextField(null=True, blank=True)

    file = models.FileField(null=True, blank=True)

    url = models.TextField(null=True)
    external_url = models.TextField(null=True)


    is_active = models.BooleanField(default=False)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class UserNotificationStatus(models.Model):
    user = models.ForeignKey(UserDetails,on_delete=models.CASCADE)
    notification = models.ForeignKey(Notification, on_delete=models.CASCADE)
    read = models.BooleanField(default=False)

