# Generated by Django 4.1.7 on 2023-03-04 23:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0017_remove_customers_sold_with'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customers',
            old_name='nsold_with',
            new_name='sold_with',
        ),
    ]