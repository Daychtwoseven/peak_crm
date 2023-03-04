from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db import transaction
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.http import require_http_methods
from .models import *

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
        context['title'] = 'PEAK CRM | Customers'
        context['module_name'] = 'Customers'
        context['action'] = 'lists'
        context['breadcrumbs'] = ['Home', 'Lists']
        context['data'] = Customers.objects.all()
        return render(request, 'backend/customers/lists.html', context)
    except Exception as e:
        print(e)


@login_required(login_url='/authentication/sign-in/')
@require_http_methods(['POST'])
def customer_add_page(request):
    try:
        with transaction.atomic():
            name = request.POST.get('name')
            email = request.POST.get('email')
            phone = request.POST.get('phone')
            address = request.POST.get('address')
            state = request.POST.get('state')
            previous_company = request.POST.get('previous_company')
            sold_with = request.POST.get('sold_with')
            dob = request.POST.get('dob')
            ss = request.POST.get('ss')
            finance_company = request.POST.get('finance_company')
            number_of_panels = request.POST.get('number_of_panels')
            contract_signed_date = request.POST.get('contract_signed_date')
            battery = request.POST.get('battery')
            kw = request.POST.get('kw')
            project_cost = request.POST.get('project_cost')
            manager = request.POST.get('manager')
            setter = request.POST.get('setter')
            closer = request.POST.get('closer')
            customer = Customers.objects.create(name=name, email=email, phone=phone, address=address, state=state,
                                                previous_company=previous_company, sold_with=sold_with, dob=dob, ss=ss,
                                                finance_company=finance_company, number_of_panels=number_of_panels,
                                                battery=battery, kw=kw, project_cost=project_cost,
                                                created_by=request.user)

            if contract_signed_date:
                customer.contract_signed_date = contract_signed_date
                customer.save()

            if manager:
                customer.manager_id = manager
                customer.save()

            if setter:
                customer.setter_id = setter
                customer.save()

            if closer:
                customer.closer_id = closer
                customer.save()

            people = request.POST.getlist('people')
            for row in people:
                if row != 'undefined':
                    customer_peoples = CustomersPeople.objects.create(customer=customer, user_id=row,
                                                                      added_by=request.user)
            CustomersPeople.objects.create(customer=customer, user_id=request.user.id, added_by=request.user)

            front_of_house = [
                {'file': row}
                for row in request.FILES.getlist('front_of_house')
            ]

            panel_layout = [
                {'file': row}
                for row in request.FILES.getlist('panel_layout')
            ]

            for row in front_of_house:
                fs = FileSystemStorage()
                name = fs.save(row['file'], row['file'])
                customer_attachments = CustomersAttachments.objects.create(customer=customer, attachment=fs.url(name),
                                                                           field='front_of_house',
                                                                           uploaded_by=request.user)

            for row in panel_layout:
                fs = FileSystemStorage()
                name = fs.save(row['file'], row['file'])
                customer_attachments = CustomersAttachments.objects.create(customer=customer, attachment=fs.url(name),
                                                                           field='panel_layout',
                                                                           uploaded_by=request.user)


            return JsonResponse({'statusMsg': 'Success'}, status=200)
    except Exception as e:
        print(e)
        return JsonResponse({'statusMsg': str(e)}, status=404)


@login_required(login_url='/authentication/sign-in/')
@require_http_methods(['POST'])
def customer_update_page(request):
    try:
        customer = Customers.objects.get(id=request.POST.get('id'))
        field = request.POST.get('field')
        value = request.POST.get('value')

        if field == "previous_company":
            customer.previous_company = value
            customer.save()

        return JsonResponse({'statusMsg': ' '.join(field.split('_')).title()}, status=200)
    except Exception as e:
        print(e)