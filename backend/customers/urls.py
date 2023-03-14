from django.contrib import admin
from django.urls import path, include
from . views import *


urlpatterns = [
    path('', index_page, name='backend-customers-index-page'),
    path('lists/', customers_lists_page, name='backend-customers-lists-page'),
    path('add/', customer_add_page, name='backend-customer-add-page'),
    path('update/', customer_update_page, name='backend-customer-update-page'),
    path('add-option/', customer_add_option_page, name='backend-customer-add-option-page'),

    path('view-updates/<slug:pk>/', customer_view_updates, name='backend-customer-view-updates-page'),
    path('add-group/', add_group_page, name='backend-add-group-index-page'),
    path('groups/', groups_index_page, name='backend-groups-index-page'),

    path('select-option/<slug:pk>/<slug:field_name>/', select_option_page, name='backend-select-option-page'),
    path('select-group/', select_group_page, name='backend-select-group-page')
]
