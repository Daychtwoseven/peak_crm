from django.contrib import admin
from django.urls import path, include
from . views import *


urlpatterns = [
    path('', index_page, name='backend-customers-index-page'),
    path('lists/', customers_lists_page, name='backend-customers-lists-page'),
]
