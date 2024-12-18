# Generated by Django 2.2.28 on 2024-11-14 16:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_auto_20241108_2247'),
    ]

    operations = [
        migrations.AlterField(
            model_name='associate',
            name='associate_id',
            field=models.CharField(blank=True, max_length=20, null=True, unique=True),
        ),
        migrations.AlterField(
            model_name='associate',
            name='company',
            field=models.CharField(default='Hyscaler', max_length=50),
        ),
        migrations.AlterField(
            model_name='associate',
            name='joining_date',
            field=models.DateField(auto_now_add=True),
        ),
    ]
