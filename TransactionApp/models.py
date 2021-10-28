from django.db import models

# Create your models here.
from UserApp.models import UserDetails


class Transaction(models.Model):
    transaction_id = models.CharField(max_length=50)
    user  = models.ForeignKey(UserDetails,on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    description = models.CharField(max_length=255,null=True)
    amount_in = models.FloatField(null=True)
    amount_out = models.FloatField(null=True)

