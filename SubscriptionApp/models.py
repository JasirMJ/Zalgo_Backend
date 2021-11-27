from django.db import models

# Create your models here.
from ProductApp.models import Product
from UserApp.models import UserDetails


class Subscription(models.Model):
    name = models.CharField(max_length=50)
    user  = models.ForeignKey(UserDetails,on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    product = models.ForeignKey(Product,null=True,on_delete=models.PROTECT )
    is_free_trail = models.BooleanField(default=False)
    subscribed_date = models.DateField(null=True)
    subscription_end_date = models.DateField(null=True)

    class Meta:
        unique_together = [['user','product','is_free_trail']]