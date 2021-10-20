from django.db import models

# Create your models here.
from UserApp.models import UserDetails

CHOICES =[

]

class RequestModel(models.Model):
    name = models.CharField(max_length=255,null=False, blank=True)
    user = models.ForeignKey(UserDetails,on_delete=models.CASCADE,null=False, blank=True)


    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
