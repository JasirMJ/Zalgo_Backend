# Generated by Django 3.2.8 on 2021-11-29 17:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SubscriptionApp', '0010_alter_subscription_unique_together'),
    ]

    operations = [
        migrations.AddField(
            model_name='subscription',
            name='subscriptionId',
            field=models.CharField(max_length=50, null=True),
        ),
    ]