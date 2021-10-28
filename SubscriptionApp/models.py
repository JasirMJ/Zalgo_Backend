from django.db import models

# Create your models here.
from UserApp.models import UserDetails


class Subscription(models.Model):
    name = models.CharField(max_length=50)
    user  = models.ForeignKey(UserDetails,on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    subscribed_date = models.DateField(null=True)
    subscription_end_date = models.DateField(null=True)

