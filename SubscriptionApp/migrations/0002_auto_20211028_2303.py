# Generated by Django 3.2.8 on 2021-10-28 17:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SubscriptionApp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subscription',
            name='subscribed_date',
            field=models.DateField(null=True),
        ),
        migrations.AlterField(
            model_name='subscription',
            name='subscription_end_date',
            field=models.DateField(null=True),
        ),
    ]
