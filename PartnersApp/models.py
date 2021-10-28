from django.db import models

# Create your models here.
from UserApp.models import UserDetails


class Partners(models.Model):

    user  = models.ForeignKey(UserDetails,on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    file = models.FileField(null=True)
    description = models.CharField(max_length=255,null=True)


