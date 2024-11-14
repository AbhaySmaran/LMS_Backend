from django.urls import path
from .views import *

urlpatterns = [
    path('list/', LeavesView.as_view(), name='login'),
    path('leave-setup/update/',LeaveSetupUpdateOrCreateAPIView.as_view()) ,
    path('leave-setup/list/',LeaveSetupView.as_view()),
    path('data/',LeavesData.as_view()),
    path('applications/',LeaveApplicationView.as_view()),
    path('applications/<int:id>/',LeaveApplicationsListView.as_view()),
    path('application/<int:id>/',LeaveApplicationUpdateView.as_view()),
    path('holidays/',HolidayView.as_view()),
    path('pending/applications/',PendingLeaveApplications.as_view()),
    path('statistics/',StatisticsView.as_view()),
]