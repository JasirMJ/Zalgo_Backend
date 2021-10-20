from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser, User
from django.utils import timezone

# Create your models here.


class UserDetails(AbstractUser):
    # user = models.ForeignKey(User,on_delete=models.CASCADE)
    mobile = models.CharField(unique=True,max_length=12,null=False)
    referal_code = models.CharField(null=True,max_length=12)
    referal_user = models.CharField(null=True,max_length=50)
    referal_code_used = models.CharField(null=True,max_length=12)
    referred_count = models.CharField(null=True,max_length=12)
    file = models.FileField(null=True)

    pan_card_details = models.CharField(null=True,max_length=255)
    bankaccount_details = models.CharField(null=True,max_length=255)

    vip_rank = models.CharField(null=True,max_length=10)

    wallet_balance = models.CharField(null=True,max_length=50)
    wallet_credited = models.CharField(null=True,max_length=50)
    wallet_withdraw = models.CharField(null=True,max_length=50)




    player_id = models.CharField(null=True,max_length=200)

    # address_id = models.CharField(max_length=100,null=True)
    # address_txt = models.CharField(max_length=100,null=True)
    # pin = models.CharField(max_length=10,null=True)
    # latitude = models.CharField(max_length=100,null=True)
    # longitude = models.CharField(max_length=100,null=True)
    # is_active = models.BooleanField(default=1)
    is_blocked = models.BooleanField(default=0)
    is_deleted = models.BooleanField(default=0)
    is_partner = models.BooleanField(default=0)



# class MyUser(AbstractBaseUser):
#     first_name = models.CharField(max_length=100,null=True)
#     last_name = models.CharField(max_length=100,null=True)
#     username = models.CharField(max_length=100,null=False,unique=True)
#     email = models.EmailField(blank=True,null=True)
#     mobile = models.CharField(max_length=15,null=True)
#     address = models.CharField(max_length=100,null=True)
#     pin = models.CharField(max_length=10,null=True)
#     latitude = models.CharField(max_length=100,null=True)
#     longitude = models.CharField(max_length=100,null=True)
#     is_active = models.BooleanField(default=1)
#     is_blocked = models.BooleanField(default=0)
#     is_deleted = models.BooleanField(default=0)
#
#     USERNAME_FIELD = "username"
