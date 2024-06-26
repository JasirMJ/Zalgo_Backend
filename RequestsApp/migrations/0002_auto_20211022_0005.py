# Generated by Django 3.2.8 on 2021-10-21 18:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('RequestsApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='requestmodel',
            name='account_number',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='broker',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='customer_name',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='is_free_trail',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='is_paid',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='password',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='phone_number',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='request_by',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AddField(
            model_name='requestmodel',
            name='server',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
