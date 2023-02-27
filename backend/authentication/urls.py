from django.contrib import admin
from django.urls import path, include
from . views import *


urlpatterns = [
    path('sign-in/', sign_in_page, name='backend-authentication-sign-in-page'),
    path('sign-out/', sign_out_page, name='backend-authentication-sign-out-page'),
]
