# Generated by Django 3.2.8 on 2021-10-22 18:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('BannerApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='banner',
            name='type',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
