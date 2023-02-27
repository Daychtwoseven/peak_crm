from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.http import require_http_methods
from . decorators import unauthenticated_user, authenticated_user


@unauthenticated_user
@require_http_methods(['GET', 'POST'])
def sign_in_page(request):
    try:
        if request.method == "POST":
            username = request.POST.get('username')
            password = request.POST.get('password')
            user = authenticate(request, username=username, password=password)
            if user:
                login(request, user)
                return JsonResponse({'statusMsg': 'Success'}, status=200)
            else:
                return JsonResponse({'statusMsg': 'Username or Password is incorrect.'}, status=404)

        elif request.method == "GET":
            print('heress')
            return render(request, 'backend/authentication/sign-in.html')
    except Exception as e:
        print(str(e))
        return JsonResponse({'statusMsg': 'Something went wrong.'}, status=404)


@authenticated_user
def sign_out_page(request):
    logout(request)
    print('here')
    return redirect('backend-authentication-sign-in-page')