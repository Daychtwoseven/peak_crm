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
        print('here')
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
            contractor = request.POST.get('contractor')
            permit_specialist = request.POST.get('permit_specialist')
            customer = Customers.objects.create(name=name, email=email, phone=phone, address=address, state=state,
                                                previous_company=previous_company, dob=dob, ss=ss,
                                                finance_company=finance_company, number_of_panels=number_of_panels,
                                                kw=kw, project_cost=project_cost,
                                                created_by=request.user)

            if sold_with:
                customer.sold_with_id = sold_with
                customer.save()

            if contract_signed_date:
                customer.contract_signed_date = contract_signed_date
                customer.save()

            if battery:
                customer.battery_id = battery
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

            if contractor:
                customer.contractor_id = contractor
                customer.save()

            if permit_specialist:
                customer.permit_specialist_id = permit_specialist
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
        field_type = request.POST.get('field_type')

        if field_type == "selection":
            value = CustomerSelectOptions.objects.filter(id=request.POST.get('value')).first()
            print(customer.sold_with)
            if field == "sold_with":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Sold '
                                                                                                               'With',
                                                        from_value=customer.sold_with.name if customer.sold_with else '', to_value=value.name, field_type='choices')
                    customer.sold_with = value
                    customer.save()

            elif field == "design_requested":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Design Requested',
                                                        from_value=customer.design_requested.name if customer.design_requested else '', to_value=value.name)
                    customer.design_requested = value
                    customer.save()

            elif field == "pe_stamp_requested":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='PE Stamp Requested',
                                                        from_value=customer.pe_stamp_requested.name if customer.pe_stamp_requested else '', to_value=value.name)
                    customer.pe_stamp_requested = value
                    customer.save()

            elif field == "permit_submitted":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Permit Submitted',
                                                        from_value=customer.permit_submitted.name if customer.permit_submitted else '', to_value=value.name)
                    customer.permit_submitted = value
                    customer.save()

            elif field == "permit_approved":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Permit Approved',
                                                        from_value=customer.permit_approved.name if customer.permit_approved else '', to_value=value.name)
                    customer.permit_approved = value
                    customer.save()

            elif field == "ic_submitted":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='IC Submitted',
                                                        from_value=customer.ic_submitted.name if customer.ic_submitted else '', to_value=value.name)
                    customer.ic_submitted = value
                    customer.save()

            elif field == "ic_approved":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='IC Approved',
                                                        from_value=customer.ic_approved.name if customer.ic_approved else '', to_value=value.name)
                    customer.ic_approved = value
                    customer.save()

            elif field == "install_confirmed":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Install Confirmed',
                                                        from_value=customer.install_confirmed.name if customer.install_confirmed else '', to_value=value.name)
                    customer.install_confirmed = value
                    customer.save()

            elif field == "install_complete":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Install Complete',
                                                        from_value=customer.install_complete.name if customer.install_complete else '', to_value=value.name)
                    customer.install_complete = value
                    customer.save()

            elif field == "equipment_ordered":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Equipment Ordered',
                                                        from_value=customer.equipment_ordered.name if customer.equipment_ordered else '', to_value=value.name)
                    customer.equipment_ordered = value
                    customer.save()

            elif field == "battery":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Battery',
                                                        from_value=customer.battery.name if customer.battery else '', to_value=value.name)
                    customer.battery = value
                    customer.save()

        elif field_type == "input":
            value = request.POST.get('value')
            if field == "previous_company":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Previous Company',
                                                        from_value=customer.previous_company, to_value=value, field_type='text')
                    customer.previous_company = value
                    customer.save()

            elif field == "dob":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='DOB',
                                                        from_value=customer.dob, to_value=value, field_type='text')
                    customer.dob = value
                    customer.save()

            elif field == "ss":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='SS',
                                                        from_value=customer.ss, to_value=value, field_type='text')
                    customer.ss = value
                    customer.save()

            elif field == "finance_company":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Finance Company',
                                                        from_value=customer.finance_company, to_value=value, field_type='text')
                    customer.finance_company = value
                    customer.save()

            elif field == "number_of_panels":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Number of Panels',
                                                        from_value=customer.number_of_panels, to_value=value, field_type='number')
                    customer.number_of_panels = value
                    customer.save()

            elif field == "contract_signed_date":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Contract Signed Date',
                                                        from_value=customer.contract_signed_date, to_value=value, field_type='date')
                    customer.contract_signed_date = value
                    customer.save()

            elif field == "install_date":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Install Date',
                                                        from_value=customer.install_date, to_value=value, field_type='date')
                    customer.install_date = value
                    customer.save()

            elif field == "contract_value":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Contract Value',
                                                        from_value=customer.contract_value, to_value=value, field_type='number')
                    customer.contract_value = value
                    customer.save()

            elif field == "ahj":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='AHJ',
                                                        from_value=customer.ahj, to_value=value, field_type='text')
                    customer.ahj = value
                    customer.save()

            elif field == "ahj_phone":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='AHJ Phone',
                                                        from_value=customer.ahj_phone, to_value=value, field_type='text')
                    customer.ahj_phone = value
                    customer.save()

            elif field == "permit_plan_number":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Permit Plan Number',
                                                        from_value=customer.permit_plan_number, to_value=value, field_type='number')
                    customer.permit_plan_number = value
                    customer.save()

            elif field == "permit_notes":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Permit Notes',
                                                        from_value=customer.permit_notes, to_value=value, field_type='text')
                    customer.permit_notes = value
                    customer.save()

            elif field == "utility_and_esid":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Utilities and ESID',
                                                        from_value=customer.utility_and_esid, to_value=value, field_type='text')
                    customer.utility_and_esid = value
                    customer.save()

            elif field == "kw":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='KW',
                                                        from_value=customer.kw, to_value=value, field_type='number')
                    customer.kw = value
                    customer.save()

            elif field == "project_cost":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Project Cost',
                                                        from_value=customer.project_cost, to_value=value, field_type='number')
                    customer.project_cost = value
                    customer.save()

            elif field == "their_company_cost":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Their Company Cost',
                                                        from_value=customer.their_company_cost, to_value=value, field_type='number')
                    customer.their_company_cost = value
                    customer.save()

            elif field == "their_company_mo":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Their Company MO',
                                                        from_value=customer.their_company_mo, to_value=value, field_type='number')
                    customer.their_company_mo = value
                    customer.save()

            elif field == "commission_percentage":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Commission Percentage',
                                                        from_value=customer.commission_percentage, to_value=value, field_type='number')
                    customer.commission_percentage = value
                    customer.save()

            elif field == "calc_red":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Calc/Red',
                                                        from_value=customer.calc_red, to_value=value, field_type='text')
                    customer.calc_red = value
                    customer.save()

            elif field == "bank_funded":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Bank Funded',
                                                        from_value=customer.bank_funded, to_value=value, field_type='text')
                    customer.bank_funded = value
                    customer.save()

            elif field == "adders":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Adders',
                                                        from_value=customer.adders, to_value=value, field_type='text')
                    customer.adders = value
                    customer.save()

            elif field == "design_fee":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Design Fee',
                                                        from_value=customer.design_fee, to_value=value, field_type='number')
                    customer.design_fee = value
                    customer.save()

            elif field == "paid_to_manager":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Paid to Manager',
                                                        from_value=customer.paid_to_manager, to_value=value, field_type='choices')
                    customer.paid_to_manager = value
                    customer.save()

            elif field == "paid_to_closer":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Paid to Closer',
                                                        from_value=customer.paid_to_closer, to_value=value, field_type='choices')
                    customer.paid_to_closer = value
                    customer.save()

            elif field == "paid_to_setter":
                with transaction.atomic():
                    CustomerActivityLogs.objects.create(customer=customer, created_by=request.user, field_name='Paid to Setter',
                                                        from_value=customer.paid_to_setter, to_value=value, field_type='choices')
                    customer.paid_to_setter = value
                    customer.save()

        return JsonResponse({'statusMsg': ' '.join(field.split('_')).title()}, status=200)

    except Exception as e:
        print(e)


@login_required(login_url='/authentication/sign-in/')
@require_http_methods(['POST'])
def customer_add_option_page(request):
    try:
        field_name = request.POST.get('field_option_name')
        option_name = request.POST.get('option_name')

        if option_name:
            if not CustomerSelectOptions.objects.filter(field_name=field_name, name__icontains=option_name).first():
                CustomerSelectOptions.objects.create(field_name=field_name, name=option_name, created_by=request.user)
                return JsonResponse({'statusMsg': f'{option_name} Option Added'}, status=200)
            else:
                return JsonResponse({'statusMsg': 'Option Name Already Exist'}, status=404)
        return JsonResponse({'statusMsg': 'Empty option'}, status=404)
    except Exception as e:
        print(e)


@login_required(login_url='/authentication/sign-in/')
@require_http_methods(['GET'])
def customer_view_updates(request, pk):
    context['data'] = Customers.objects.get(id=pk)
    return render(request, 'backend/customers/partials/view-updates.html', context)
