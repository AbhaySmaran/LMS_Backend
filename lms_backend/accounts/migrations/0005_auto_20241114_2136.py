# Generated by Django 2.2.28 on 2024-11-14 16:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_auto_20241114_2133'),
    ]

    operations = [
        migrations.AlterField(
            model_name='associate',
            name='gender',
            field=models.CharField(max_length=10),
        ),
    ]
