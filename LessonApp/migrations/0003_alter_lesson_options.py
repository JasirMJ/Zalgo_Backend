# Generated by Django 3.2.8 on 2021-11-02 18:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('LessonApp', '0002_alter_lesson_name'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='lesson',
            options={'ordering': ['id']},
        ),
    ]
