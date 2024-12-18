# Generated by Django 2.2.28 on 2024-11-12 03:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('leaves', '0007_auto_20241111_2021'),
    ]

    operations = [
        migrations.CreateModel(
            name='Holiday',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('year', models.IntegerField()),
                ('date', models.DateField()),
                ('holiday_name', models.CharField(max_length=50)),
            ],
        ),
        migrations.RemoveField(
            model_name='leaveapplication',
            name='approval_id',
        ),
        migrations.AlterField(
            model_name='leaveapplication',
            name='half_day_type',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
    ]
