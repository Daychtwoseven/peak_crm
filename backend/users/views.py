from django.http import HttpResponseNotFound
from django.shortcuts import render, redirect
from django.contrib.auth.models import User, Group
from django.contrib import messages

context = {}
def index_page(request):
    try:
        if str(request.user.groups.all()[0]) == "admin":
            context['title'] = 'PEAK CRM | Users'
            context['module_name'] = 'Users'
            context['action'] = None
            context['breadcrumbs'] = ['Home', 'Users']
            context['data'] = User.objects.exclude(id=request.user.id)
            return render(request, 'backend/users/index.html', context)
        else:
            return HttpResponseNotFound()
    except Exception as e:
        return HttpResponseNotFound(str(e))


def update_user_page(request, pk):
    try:
        if str(request.user.groups.all()[0]) == "admin":
            user = User.objects.get(id=pk)
            if request.method == "POST":
                username = request.POST.get('username')
                email = request.POST.get('email')
                first_name = request.POST.get('first_name')
                last_name = request.POST.get('last_name')
                permission = request.POST.get('permission')

                user.username = username
                user.email = email
                user.first_name = first_name
                user.last_name = last_name
                user.save()

                user.groups.clear()
                group = Group.objects.get(name=permission)
                user.groups.add(group)
                messages.success(request, f'User {username} successfully updated!')
                return redirect('backend-users-index-page')
            else:
                context['data'] = user
                return render(request, 'backend/users/partials/update-user-modal-content.html', context)
        else:
            return HttpResponseNotFound()
    except Exception as e:
        return HttpResponseNotFound(str(e))


def add_user_page(request):
    try:
        if request.method == "POST":
            username = request.POST.get('username')
            email = request.POST.get('email')
            first_name = request.POST.get('first_name')
            last_name = request.POST.get('last_name')
            permission = request.POST.get('permission')
            password = request.POST.get('password')
            password2 = request.POST.get('password2')
            if password == password2:
                user = User.objects.create_user(username=username, email=email, first_name=first_name,
                                                last_name=last_name, password=password, is_active=True)
                group = Group.objects.get(name=permission)
                user.groups.add(group)
                messages.success(request, f'User {username} successfully added!')
                return redirect('backend-users-index-page')
        else:
            return render(request, 'backend/users/partials/add-user-modal-content.html')
    except Exception as e:
        return HttpResponseNotFound(str(e))