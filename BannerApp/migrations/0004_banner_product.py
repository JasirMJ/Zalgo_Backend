# Generated by Django 3.2.8 on 2021-10-28 17:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ProductApp', '0001_initial'),
        ('BannerApp', '0003_banner_is_internal'),
    ]

    operations = [
        migrations.AddField(
            model_name='banner',
            name='product',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ProductApp.product'),
        ),
    ]
