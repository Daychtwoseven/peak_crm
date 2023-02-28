from django.db import models
from django.contrib.auth.models import AbstractUser
import uuid

class Customers(models.Model):
    BATTERY_CHOICES = [
        ('no_bat', 'No Battery'),
        ('3_kw', '3KW'),
        ('6_kw', '6KW'),
        ('10_kw', '10KW')
    ]

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    phone = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    previous_company = models.CharField(max_length=255)
    sold_with = models.CharField(max_length=255)
    state = models.CharField(max_length=255)
    dob = models.CharField(max_length=255)
    ss = models.CharField(max_length=255)
    finance_company = models.CharField(max_length=255)
    number_of_panels = models.CharField(max_length=255)
    contract_signed_date = models.DateField(auto_now=False, null=True, blank=True)
    design_requested = models.CharField(max_length=255)
    pe_stamp_requested = models.CharField(max_length=255)
    permit_submitted = models.BooleanField()
    interconnection_submitted = models.BooleanField()
    permit_approved = models.CharField(max_length=255)
    interconnection_approved = models.CharField(max_length=255)
    install_date = models.CharField(max_length=255)
    install_confirmed = models.CharField(max_length=255)
    equipment_ordered = models.CharField(max_length=255)
    install_complete = models.CharField(max_length=255)
    contract_value = models.CharField(max_length=255)
    ahj = models.CharField(max_length=255)
    ahj_phone = models.CharField(max_length=255)
    permit_plan_number = models.CharField(max_length=255)
    permit_notes = models.CharField(max_length=255)
    utility_and_esid = models.CharField(max_length=255)
    approved_permit = models.FileField()
    battery = models.CharField(max_length=255, choices=BATTERY_CHOICES)
    kw = models.CharField(max_length=255)
    project_cost = models.CharField(max_length=255)
    their_company_cost = models.CharField(max_length=255)
    their_company_mo = models.CharField(max_length=255)
    commission_percentage = models.CharField(max_length=255)
    bank_funded = models.CharField(max_length=255)
    adders = models.CharField(max_length=255)
    paid_to_manager = models.CharField(max_length=255)
    paid_to_closer = models.CharField(max_length=255)
    paid_to_setter = models.CharField(max_length=255)


class CustomersFiles(models.Model):
    VALUE_CHOICES = [
        ('utility_and_esid', 'Utility & ESID'),
        ('approved_permit', 'Approved Permit'),
        ('contract', 'Contract'),
        ('stamped_plans', 'Stamped Plans'),
        ('ub', 'UB'),
        ('hoi', 'HOI'),
        ('front_of_house', 'Front Of House'),
        ('panel_layout', 'Panel Layout'),
        ('post_install_letter', 'Post Install Letter'),
    ]
    customer = models.ForeignKey(Customers, models.RESTRICT)
