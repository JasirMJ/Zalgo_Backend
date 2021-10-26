from django.db import models

# Create your models here.
from LessonApp.models import Lesson


class Course(models.Model):
    name = models.CharField(max_length=50,unique=True)
    course_duration = models.CharField(max_length=50,null=True)
    file = models.FileField(null=False,blank=False)
    description = models.TextField(null=True)
    priority = models.IntegerField(null=True)
    is_active = models.BooleanField(default=True)
    lessons = models.ManyToManyField(Lesson)
