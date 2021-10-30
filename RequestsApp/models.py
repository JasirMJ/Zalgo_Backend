from django.db import models

# Create your models here.
from UserApp.models import UserDetails

CHOICES =[

]

class RequestModel(models.Model):
    name = models.CharField(max_length=255,null=False, blank=True)
    user = models.ForeignKey(UserDetails,on_delete=models.CASCADE,null=False, blank=True)
    request_by = models.CharField(max_length=255, null=False, blank=True)
    payment_status = models.CharField(max_length=20, null=True)  # success, failed
    amount = models.CharField(max_length=20, null=True)

    customer_name = models.CharField(max_length=255, null=True, blank=True)
    account_number = models.CharField(max_length=255, null=True, blank=True) #for paid customers only
    broker = models.CharField(max_length=255, null=True, blank=True)
    server = models.CharField(max_length=255, null=True, blank=True)
    phone_number = models.CharField(max_length=255, null=True, blank=True)
    password = models.CharField(max_length=255, null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    is_paid = models.BooleanField(default=False)
    is_free_trail = models.BooleanField(default=False)




