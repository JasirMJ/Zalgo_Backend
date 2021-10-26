from django.db import models

# Create your models here.

class Topic(models.Model):
    name = models.CharField(max_length=50,unique=True)
    duration = models.CharField(max_length=50,null=True)
    file = models.FileField(null=False,blank=False)
    description = models.TextField(null=True)
    url = models.URLField(max_length=255,null=True)
    priority = models.IntegerField(null=True)
    is_active = models.BooleanField(default=True)
