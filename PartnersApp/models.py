from django.db import models

# Create your models here.
from UserApp.models import UserDetails


class Partners(models.Model):

    name  = models.CharField(max_length=255,null=False)
    phone  = models.CharField(max_length=20,null=False)
    available_at  = models.CharField(max_length=20,null=True)
    user  = models.ForeignKey(UserDetails,on_delete=models.PROTECT,null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    file = models.FileField(null=True)
    description = models.CharField(max_length=255,null=True)
    vip_rank = models.CharField(max_length=20,null=True)
    is_hidden = models.BooleanField(default=False)


