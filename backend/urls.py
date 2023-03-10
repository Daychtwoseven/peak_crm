from django.contrib import admin
from django.urls import path, include
from . views import *


urlpatterns = [
    # Backend Sub Apps
    path('authentication/', include('backend.authentication.urls')),
    path('customers/', include('backend.customers.urls')),
    path('users/', include('backend.users.urls')),

    path('', index_page, name='backend-index-page'),
    path('<slug:action>/', index_page, name='backend-index-page'),
    path('<slug:action>/<slug:pk>/', index_page, name='backend-index-page'),


]
