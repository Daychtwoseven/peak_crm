# Generated by Django 4.1.7 on 2023-03-04 08:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0012_customers_design_fee'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customers',
            name='equipment_ordered',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='customers',
            name='install_complete',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='customers',
            name='install_confirmed',
            field=models.BooleanField(default=False),
        ),
    ]