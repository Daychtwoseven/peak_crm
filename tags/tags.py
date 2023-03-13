from django import template
from django.db.models import Q
from backend.customers.models import *
from datetime import datetime

register = template.Library()


@register.simple_tag
def none_checker(data):
    return data if data else ''


@register.simple_tag
def users(request):
    return User.objects.filter(is_active=True).exclude(id=request.user.id)


@register.simple_tag
def managers(request):
    return User.objects.filter(groups__name='manager', is_active=True).all()


@register.simple_tag
def closers(request):
    return User.objects.filter(Q(groups__name='closer') | Q(groups__name='setter'), is_active=True).all()


@register.simple_tag
def contractors(request):
    return User.objects.filter(groups__name='contractor', is_active=True).all()


@register.simple_tag
def permit_specialists(request):
    return User.objects.filter(groups__name='permit_specialist', is_active=True).all()


@register.simple_tag
def colors():
    return ['success', 'danger', 'warning', 'primary', 'info']


@register.simple_tag
def customer_selection_options(field_name):
    return CustomerSelectOptions.objects.filter(field_name=field_name).all()


@register.simple_tag
def datetime_now():
    return datetime.now()


@register.simple_tag
def groups():
    return CustomerGroups.objects.filter(is_active=True).all()