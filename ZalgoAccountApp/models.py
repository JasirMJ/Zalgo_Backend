from django.db import models

# Create your models here.
from LessonApp.models import Lesson
from UserApp.models import UserDetails


class ZalgoAccount(models.Model):
    first_name = models.CharField(max_length=50,null=False)
    last_name = models.CharField(max_length=50,null=False)
    user = models.ForeignKey(UserDetails,on_delete=models.PROTECT)
    email = models.CharField(max_length=50,null=False)
    mobile = models.CharField(max_length=20,null=False)
    gender = models.CharField(max_length=10,default='male')

    dob = models.DateField(null=False)
    national_id_file = models.FileField(null=False,blank=False)
    national_id = models.CharField(max_length=50,null=False,blank=False)
    pancard_file = models.FileField(null=False, blank=False)
    parncard = models.CharField(max_length=50,null=False,blank=False)

    house_name = models.TextField(null=False)
    street_name = models.CharField(max_length=50,null=False,blank=False)
    pincode = models.CharField(max_length=10,null=False,blank=False)
    city = models.CharField(max_length=50,null=False,blank=False)

