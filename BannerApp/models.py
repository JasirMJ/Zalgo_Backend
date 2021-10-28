from django.db import models

# Create your models here.
from ProductApp.models import Product


class Banner(models.Model):
    name = models.CharField(max_length=255,null=False, blank=True)
    type = models.CharField(max_length=255,null=True, blank=True)
    description = models.TextField(null=True, blank=True)

    file = models.FileField(null=True, blank=True)

    url = models.TextField(null=True)

    is_internal = models.BooleanField(default=False)
    product = models.ForeignKey(Product,on_delete=models.CASCADE)


    is_active = models.BooleanField(default=False)
    is_broker_image = models.BooleanField(default=False)


