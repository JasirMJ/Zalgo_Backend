# Generated by Django 3.2.8 on 2021-11-29 18:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('RequestsApp', '0004_requestmodel_available_at'),
    ]

    operations = [
        migrations.AddField(
            model_name='requestmodel',
            name='productId',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='subproductId',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='subscriptionId',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
