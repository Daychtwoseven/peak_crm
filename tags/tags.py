from django import template
from django.contrib.auth.models import User
from django.db.models import Q

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
def colors():
    return ['success', 'danger', 'warning', 'primary', 'info']