from django.db import models

# Create your models here.
from UserApp.models import UserDetails


class SubProduct(models.Model):
    name = models.CharField(max_length=255,null=False)
    file = models.FileField(null=True, blank=True)
    price = models.CharField(max_length=255,null=True,blank=True)
    description = models.TextField()




class Product(models.Model):
    name = models.CharField(max_length=255,null=False, blank=True)
    price = models.CharField(max_length=255,null=True,blank=True)
    description = models.TextField()
    external_url = models.TextField(null=True, blank=True)
    terms_and_condition = models.CharField(max_length=255, null=True, blank=True)
    file = models.FileField(null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    is_product = models.BooleanField(default=False)
    is_service = models.BooleanField(default=False)
    is_subscribable = models.BooleanField(default=False)

    is_free_trail = models.BooleanField(default=False)

    sub_product = models.ManyToManyField(SubProduct)


