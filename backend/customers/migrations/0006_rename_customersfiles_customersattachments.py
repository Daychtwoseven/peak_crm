# Generated by Django 4.1.7 on 2023-03-03 12:56

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('customers', '0005_customers_created_by_customers_date_created_and_more'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='CustomersFiles',
            new_name='CustomersAttachments',
        ),
    ]
