from django.db import models

# Create your models here.
from TopicApp.models import Topic


class Lesson(models.Model):
    name = models.CharField(max_length=50)
    description = models.TextField(null=True)

    # file = models.FileField(null=False,blank=False)
    priority = models.IntegerField(null=True)
    is_active = models.BooleanField(default=True)
    topic = models.ManyToManyField(Topic)

    class Meta:
        ordering = ['id']