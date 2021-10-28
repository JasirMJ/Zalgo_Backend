from django.db import models

# Create your models here.
from UserApp.models import UserDetails


class Partners(models.Model):

    name  = models.CharField(max_length=255,null=False)
    user  = models.ForeignKey(UserDetails,on_delete=models.PROTECT,null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    file = models.FileField(null=True)
    description = models.CharField(max_length=255,null=True)


