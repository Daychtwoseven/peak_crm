from django.contrib import admin
from django.urls import path, include
from . views import *


urlpatterns = [
    path('', index_page, name='backend-users-index-page'),
    path('update-user/<slug:pk>/', update_user_page, name='backend-update-user-page'),
    path('add-user/', add_user_page, name='backend-add-user-page'),
]
