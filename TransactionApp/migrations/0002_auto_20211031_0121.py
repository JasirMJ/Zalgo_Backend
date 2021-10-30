# Generated by Django 3.2.8 on 2021-10-30 19:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ProductApp', '0001_initial'),
        ('TransactionApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='transaction',
            name='product',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ProductApp.product'),
        ),
        migrations.AddField(
            model_name='transaction',
            name='product_name',
            field=models.CharField(max_length=25, null=True),
        ),
        migrations.AddField(
            model_name='transaction',
            name='status',
            field=models.CharField(max_length=20, null=True),
        ),
    ]
