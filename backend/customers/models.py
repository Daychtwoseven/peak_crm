from django.db import models
from django.contrib.auth.models import AbstractUser, User
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
    state = models.CharField(max_length=255)
    previous_company = models.CharField(max_length=255, null=True)
    sold_with = models.CharField(max_length=255, null=True)
    dob = models.CharField(max_length=255, null=True)
    ss = models.CharField(max_length=255, null=True)
    finance_company = models.CharField(max_length=255, null=True)
    number_of_panels = models.CharField(max_length=255, null=True)
    contract_signed_date = models.DateField(auto_now=False, null=True, blank=True)
    design_requested = models.BooleanField(default=False)
    pe_stamp_requested = models.BooleanField(default=False)
    permit_submitted = models.BooleanField(default=False)
    interconnection_submitted = models.BooleanField(default=False)
    permit_approved = models.BooleanField(default=False)
    interconnection_approved = models.BooleanField(default=False)
    install_date = models.CharField(max_length=255, null=True)
    install_confirmed = models.CharField(max_length=255, null=True)
    equipment_ordered = models.CharField(max_length=255, null=True)
    install_complete = models.CharField(max_length=255, null=True)
    contract_value = models.CharField(max_length=255, null=True)
    ahj = models.CharField(max_length=255, null=True)
    ahj_phone = models.CharField(max_length=255, null=True)
    permit_plan_number = models.CharField(max_length=255, null=True)
    permit_notes = models.CharField(max_length=255, null=True)
    utility_and_esid = models.CharField(max_length=255, null=True)
    approved_permit = models.FileField()
    battery = models.CharField(max_length=255, choices=BATTERY_CHOICES, null=True)
    kw = models.CharField(max_length=255)
    project_cost = models.CharField(max_length=255, null=True)
    their_company_cost = models.CharField(max_length=255, null=True)
    their_company_mo = models.CharField(max_length=255, null=True)
    commission_percentage = models.CharField(max_length=255, null=True)
    bank_funded = models.CharField(max_length=255, null=True)
    adders = models.CharField(max_length=255, null=True)
    paid_to_manager = models.CharField(max_length=255, null=True)
    paid_to_closer = models.CharField(max_length=255, null=True)
    paid_to_setter = models.CharField(max_length=255, null=True)
    manager = models.ForeignKey(User, models.RESTRICT, null=True, related_name="user_manager")
    setter = models.ForeignKey(User, models.RESTRICT, null=True, related_name="user_setter")
    closer = models.ForeignKey(User, models.RESTRICT, null=True, related_name="user_closer")
    created_by = models.ForeignKey(User, models.RESTRICT)
    date_created = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True)

    def get_people(self):
        return CustomersPeople.objects.filter(customer_id=self.id).order_by('user__first_name')

    def get_created_by_fullname(self):
        return f'{self.created_by.first_name} {self.created_by.last_name}'


class CustomersAttachments(models.Model):
    FIELD_CHOICES = [
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
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    customer = models.ForeignKey(Customers, models.RESTRICT)
    field = models.CharField(max_length=255, choices=FIELD_CHOICES)
    attachment = models.CharField(max_length=255)
    date_uploaded = models.DateTimeField(auto_now_add=True)
    uploaded_by = models.ForeignKey(User, models.RESTRICT)
    is_active = models.BooleanField(default=True)


class CustomersPeople(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    customer = models.ForeignKey(Customers, models.RESTRICT)
    user = models.ForeignKey(User, models.RESTRICT)
    date_added = models.DateTimeField(auto_now_add=True)
    added_by = models.ForeignKey(User, models.RESTRICT, related_name='customers_people_added_by')

    def get_fullname(self):
        return f'{self.user.first_name} {self.user.last_name}'
