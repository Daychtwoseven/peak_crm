from django.shortcuts import render, redirect
from django.views.decorators.http import require_http_methods

context = {}

@require_http_methods(['GET'])
def index_page(request):
    try:
        if request.method == "GET":
            return redirect('/clients/list/')
            context['title'] = 'PEAK CRM | Clients'
            context['module_name'] = 'Clients'
            context['action'] = 'home'
            return render(request, 'backend/clients/index.html', context)
    except Exception as e:
        print(e)


@require_http_methods(['GET'])
def clients_list_page(request):
    try:
        if request.method == "GET":
            context['title'] = 'PEAK CRM | Clients'
            context['module_name'] = 'Clients'
            context['action'] = 'list'
            context['breadcrumbs'] = ['Home', 'List']
            return render(request, 'backend/clients/list.html', context)
    except Exception as e:
        print(e)