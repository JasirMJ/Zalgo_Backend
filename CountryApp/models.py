from django.db import models

# Create your models here.

class Country(models.Model):
    name = models.CharField(max_length=50,unique=True)
    file = models.FileField(null=False,blank=False)
    country_code = models.CharField(max_length=5,unique=True,null=False,blank=False)
    is_active = models.BooleanField(default=True)
