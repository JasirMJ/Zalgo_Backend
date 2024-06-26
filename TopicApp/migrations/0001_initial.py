# Generated by Django 3.2.8 on 2021-10-25 19:36

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Topic',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, unique=True)),
                ('duration', models.CharField(max_length=50, null=True)),
                ('file', models.FileField(upload_to='')),
                ('description', models.TextField(null=True)),
                ('url', models.URLField(max_length=255, null=True)),
                ('priority', models.IntegerField(null=True)),
                ('is_active', models.BooleanField(default=True)),
            ],
        ),
    ]
