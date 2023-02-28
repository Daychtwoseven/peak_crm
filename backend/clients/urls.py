from django.contrib import admin
from django.urls import path, include
from . views import *


urlpatterns = [
    path('', index_page, name='backend-clients-index-page'),
    path('lists/', clients_lists_page, name='backend-clients-lists-page'),
]
