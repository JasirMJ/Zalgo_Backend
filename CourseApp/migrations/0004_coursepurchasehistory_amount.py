# Generated by Django 3.2.8 on 2022-01-30 14:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CourseApp', '0003_auto_20220130_1955'),
    ]

    operations = [
        migrations.AddField(
            model_name='coursepurchasehistory',
            name='amount',
            field=models.FloatField(default=0.0),
        ),
    ]