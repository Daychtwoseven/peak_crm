from django.shortcuts import render
from django.contrib.auth.decorators import login_required


@login_required(login_url='/authentication/sign-in/')
def index_page(request, action=None, pk=None):
    try:
        return render(request, 'backend/main/index.html')
    except Exception as e:
        print(e)
