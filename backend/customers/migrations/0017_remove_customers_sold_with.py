# Generated by Django 4.1.7 on 2023-03-04 23:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0016_customers_nsold_with'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customers',
            name='sold_with',
        ),
    ]