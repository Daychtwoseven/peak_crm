from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.views.decorators.http import require_http_methods

context = {}


@login_required(login_url='/authentication/sign-in/')
@require_http_methods(['GET'])
def index_page(request):
    try:
        if request.method == "GET":
            return redirect('/customers/list/')
            context['title'] = 'PEAK CRM | Customers'
            context['module_name'] = 'Customers'
            context['action'] = 'home'
            return render(request, 'backend/clients/index.html', context)
    except Exception as e:
        print(e)


@login_required(login_url='/authentication/sign-in/')
@require_http_methods(['GET'])
def customers_lists_page(request):
    try:
        if request.method == "GET":
            context['title'] = 'PEAK CRM | Customers'
            context['module_name'] = 'Customers'
            context['action'] = 'lists'
            context['breadcrumbs'] = ['Home', 'Lists']
            return render(request, 'backend/customers/lists.html', context)
    except Exception as e:
        print(e)