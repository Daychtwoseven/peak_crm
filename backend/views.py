from django.shortcuts import render


def index_page(request, action=None, pk=None):
    try:
        return render(request, 'backend/main/index.html')
    except Exception as e:
        print(e)
