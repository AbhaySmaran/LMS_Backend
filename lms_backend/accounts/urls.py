from django.urls import path
from .views import *

urlpatterns = [
    path('admin/associates/', AssociatesUnderAdminView.as_view(), name='associates-under-management'),  # View associates under admin/manager
    path('manager/associates/',AssociatesUnderManagementView.as_view()),
    path('associate/list/',AssociatesView.as_view()),
    path('associate/<int:id>/',AssociatesView.as_view()),
    path('associate/register/',AssociateCreateView.as_view()),
    path('admin/applications/',ApplicationToAdminView.as_view()),
    path('manager/applications/',ApplicationToManagerView.as_view()),
]
