from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import authenticate, login
from rest_framework_simplejwt.tokens import RefreshToken
from django.db.models import Q
from .serializers import *

# Token generation helper
def get_tokens_for_user(user):
    refresh = RefreshToken.for_user(user)
    return {
        'refresh': str(refresh),
        'access': str(refresh.access_token),
    }

class UserLoginView(APIView):

    def post(self, request, *args, **kwargs):
        serializer = UserLoginSerializer(data=request.data)
        print(request.data)
        if serializer.is_valid(raise_exception=True):
            email = serializer.data.get('email')
            password = serializer.data.get('password')

            user = authenticate(email=email, password=password)

            if user is not None:
                login(request, user)
                tokens = get_tokens_for_user(user)
                # role = user.role
                return Response({
                    "message": "Login successful",
                    "tokens": tokens,
                    
                }, status=status.HTTP_200_OK)

            return Response({"errors": {"error": ["Invalid credentials"]}}, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# class UserProfileView(APIView):
#     permission_classes = [IsAuthenticated]

#     def get(self, request):
#         user_serializer = UserProfileSerializer(request.user)
#         id = user_serializer.data.get('id')
#         config = WorkflowConfiguration.objects.get(id='id')
#         serializer = WorkflowConfigurationSerializer(data=config)
#         if serializer.is_valid(raise_exception=True):
#             return Response(serializer.data)

class UserProfileView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        
        user_serializer = UserProfileSerializer(request.user)
        
        user_id = user_serializer.data.get('id')

        config = WorkflowConfiguration.objects.filter(associate_id=user_id).first()  # or `get` if it's a single object
        
        config_serializer = WorkflowConfigurationSerializer(config)
        
        response_data = {
            'user_profile': user_serializer.data,
            'workflow_configuration': config_serializer.data
        }
        
        return Response(response_data)

# class AssociatesUnderManagementView(APIView):
#     permission_classes = [IsAuthenticated]

#     def get(self, request):
#         user = request.user

#         if not (user.is_admin or user.is_manager):
#             return Response({"detail": "Access denied"}, status=status.HTTP_403_FORBIDDEN)

#         associates = Associate.objects.filter(Q(admin_id=user) | Q(manager_id=user))
#         serializer = AssociateDetailSerializer(associates, many=True)

#         return Response(serializer.data, status=status.HTTP_200_OK)
