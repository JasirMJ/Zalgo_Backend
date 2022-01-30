from pyexpat import model
from django.db import models

# Create your models here.
from LessonApp.models import Lesson
from UserApp.models import UserDetails


class Course(models.Model):
    name = models.CharField(max_length=50)
    course_duration = models.CharField(max_length=50,null=True)
    file = models.FileField(null=False,blank=False)
    description = models.TextField(null=True)
    priority = models.IntegerField(null=True)
    course_fee = models.FloatField(default=0.0)
    is_active = models.BooleanField(default=True)
    lessons = models.ManyToManyField(Lesson)


class CoursePurchaseHistory(models.Model):
    course = models.ForeignKey(Course,on_delete=models.CASCADE)
    user = models.ForeignKey(UserDetails,on_delete=models.CASCADE)
    date_time = models.DateTimeField(auto_now_add=True)
    transaction_id = models.CharField(max_length=250,null=True)
    amount = models.FloatField(default=0.0)
    is_active = models.BooleanField(default=True)