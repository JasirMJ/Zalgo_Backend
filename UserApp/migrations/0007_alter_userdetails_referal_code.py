# Generated by Django 3.2.8 on 2021-11-03 18:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('UserApp', '0006_userdetails_is_account_holder'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userdetails',
            name='referal_code',
            field=models.CharField(max_length=12, null=True, unique=True),
        ),
    ]
