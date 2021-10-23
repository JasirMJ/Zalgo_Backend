# Generated by Django 3.2.8 on 2021-10-21 19:04

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='SubProduct',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('file', models.FileField(blank=True, null=True, upload_to='')),
                ('price', models.CharField(blank=True, max_length=255, null=True)),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=255)),
                ('price', models.CharField(blank=True, max_length=255, null=True)),
                ('description', models.TextField()),
                ('terms_and_condition', models.CharField(blank=True, max_length=255, null=True)),
                ('file', models.FileField(blank=True, null=True, upload_to='')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('is_product', models.BooleanField(default=False)),
                ('is_service', models.BooleanField(default=False)),
                ('is_free_trail', models.BooleanField(default=False)),
                ('sub_product', models.ManyToManyField(to='ProductApp.SubProduct')),
            ],
        ),
    ]
