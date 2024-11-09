from django.urls import path
from .views import UserLoginView, UserProfileView

urlpatterns = [
    path('login/', UserLoginView.as_view(), name='login'),  # Login endpoint
    path('profile/', UserProfileView.as_view(), name='profile'),  # User profile endpoint# View associates under admin/manager
]
