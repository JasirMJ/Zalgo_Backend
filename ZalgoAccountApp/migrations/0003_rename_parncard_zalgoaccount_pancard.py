# Generated by Django 3.2.8 on 2021-10-30 20:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ZalgoAccountApp', '0002_auto_20211031_0129'),
    ]

    operations = [
        migrations.RenameField(
            model_name='zalgoaccount',
            old_name='parncard',
            new_name='pancard',
        ),
    ]
