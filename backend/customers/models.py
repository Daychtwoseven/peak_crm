from django.db import models
from django.contrib.auth.models import AbstractUser, User
import uuid

class Customers(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    phone = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    state = models.CharField(max_length=255)
    previous_company = models.CharField(max_length=255, null=True)
    sold_with = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='sold_with_options')
    dob = models.CharField(max_length=255, null=True)
    ss = models.CharField(max_length=255, null=True)
    finance_company = models.CharField(max_length=255, null=True)
    number_of_panels = models.CharField(max_length=255, null=True)
    contract_signed_date = models.DateField(auto_now=False, null=True, blank=True)
    design_requested = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='design_requested_options')
    pe_stamp_requested = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='pe_stamp_requested_options')
    permit_submitted = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='permit_submitted_options')
    ic_submitted = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='ic_submitted_options')
    permit_approved = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='permit_approved_options')
    ic_approved = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='ic_approved_options')
    install_date = models.CharField(max_length=255, null=True)
    install_confirmed = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='install_confirmed_options')
    equipment_ordered = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='equipment_ordered_options')
    install_complete = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='install_complete_options')
    contract_value = models.CharField(max_length=255, null=True)
    ahj = models.CharField(max_length=255, null=True)
    ahj_phone = models.CharField(max_length=255, null=True)
    permit_plan_number = models.CharField(max_length=255, null=True)
    permit_notes = models.CharField(max_length=255, null=True)
    utility_and_esid = models.CharField(max_length=255, null=True)
    battery = models.ForeignKey('CustomerSelectOptions', models.DO_NOTHING, null=True, blank=True, related_name='battery_options')
    kw = models.CharField(max_length=255)
    project_cost = models.CharField(max_length=255, null=True)
    their_company_cost = models.CharField(max_length=255, null=True)
    their_company_mo = models.CharField(max_length=255, null=True)
    commission_percentage = models.CharField(max_length=255, null=True)
    calc_red = models.CharField(max_length=255, null=True)
    bank_funded = models.CharField(max_length=255, null=True)
    adders = models.CharField(max_length=255, null=True)
    design_fee = models.CharField(max_length=255, null=True)
    paid_to_manager = models.CharField(max_length=255, null=True)
    paid_to_closer = models.CharField(max_length=255, null=True)
    paid_to_setter = models.CharField(max_length=255, null=True)
    manager = models.ForeignKey(User, models.RESTRICT, null=True, related_name="user_manager")
    setter = models.ForeignKey(User, models.RESTRICT, null=True, related_name="user_setter")
    closer = models.ForeignKey(User, models.RESTRICT, null=True, related_name="user_closer")
    contractor = models.ForeignKey(User, models.RESTRICT, null=True, related_name="contractor")
    permit_specialist = models.ForeignKey(User, models.RESTRICT, null=True, related_name="permit_specialist")
    created_by = models.ForeignKey(User, models.RESTRICT)
    date_created = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True)
    group = models.ForeignKey('CustomerGroups', models.DO_NOTHING, null=True)

    def get_people(self):
        return CustomersPeople.objects.filter(customer_id=self.id).order_by('user__first_name')

    def get_created_by_fullname(self):
        return f'{self.created_by.first_name} {self.created_by.last_name}'

    def get_customers_activity_logs(self):
        return CustomerActivityLogs.objects.filter(customer_id=self.id).order_by('-date_created')

    def approved_permit(self):
        return CustomersAttachments.objects.filter(field='approved_permit', customer_id=self.id).first()

    def contract(self):
        return CustomersAttachments.objects.filter(field='contract', customer_id=self.id).first()

    def stamped_plans(self):
        return CustomersAttachments.objects.filter(field='stamped_plans', customer_id=self.id).first()

    def ub(self):
        return CustomersAttachments.objects.filter(field='ub', customer_id=self.id).first()

    def hoi(self):
        return CustomersAttachments.objects.filter(field='hoi', customer_id=self.id).first()

    def front_of_house(self):
        return CustomersAttachments.objects.filter(field='front_of_house', customer_id=self.id).first()

    def panel_layout(self):
        return CustomersAttachments.objects.filter(field='panel_layout', customer_id=self.id).first()

    def post_install_letter(self):
        return CustomersAttachments.objects.filter(field='post_install_letter', customer_id=self.id).first()


class CustomersAttachments(models.Model):
    FIELD_CHOICES = [
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


class CustomerSelectOptions(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    color = models.CharField(max_length=255, null=True)
    field_name = models.CharField(max_length=255)
    date_created = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, models.RESTRICT)


class CustomerActivityLogs(models.Model):
    FIELD_TYPE_CHOICES = [
        ('text', 'text'),
        ('date', 'date'),
        ('number', 'number'),
        ('choices', 'choices'),
    ]
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    customer = models.ForeignKey(Customers, models.RESTRICT)
    created_by = models.ForeignKey(User, models.RESTRICT)
    date_created = models.DateTimeField(auto_now_add=True)
    field_name = models.CharField(max_length=255)
    field_type = models.CharField(max_length=255)
    from_value = models.CharField(max_length=255)
    to_value = models.CharField(max_length=255)


class CustomerGroups(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    date_created = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, models.RESTRICT)
    is_active = models.BooleanField(default=True)