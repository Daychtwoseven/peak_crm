from django.contrib import admin
from django.urls import path, include
from . views import *


urlpatterns = [
    path('', index_page, name='backend-customers-index-page'),
    path('lists/', customers_lists_page, name='backend-customers-lists-page'),
    path('add/', customer_add_page, name='backend-customer-add-page'),
    path('update/', customer_update_page, name='backend-customer-update-page'),
    path('add-option/', customer_add_option_page, name='backend-customer-add-option-page'),
]
