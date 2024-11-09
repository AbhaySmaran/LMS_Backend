from django.urls import path
from .views import *

urlpatterns = [
    path('list/', LeavesView.as_view(), name='login'), 
]