# Generated by Django 4.1.7 on 2023-03-04 22:16

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('customers', '0013_alter_customers_equipment_ordered_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='customers',
            name='contractor',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.RESTRICT, related_name='contractor', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='customers',
            name='permit_specialist',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.RESTRICT, related_name='permit_specialist', to=settings.AUTH_USER_MODEL),
        ),
    ]
