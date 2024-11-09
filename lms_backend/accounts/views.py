from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import authenticate, login
from rest_framework_simplejwt.tokens import RefreshToken
from django.db.models import Q
from .serializers import *
from .models import *
from authentication.serializers import *
# Create your views here.
# class AssociatesUnderManagementView(APIView):
#     permission_classes = [IsAuthenticated]

#     def get(self, request):
#         user = request.user

#         if not (user.is_admin or user.is_manager):
#             return Response({"detail": "Access denied"}, status=status.HTTP_403_FORBIDDEN)
#         id = user.id
#         associates = Associate.objects.filter(Q(id=id) | Q(id=id))
#         serializer = AssociateDetailSerializer(associates, many=True)

#         return Response(serializer.data, status=status.HTTP_200_OK)


class AssociatesUnderManagementView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user

        if not (user.is_admin or user.is_manager):
            return Response({"detail": "Access denied"}, status=status.HTTP_403_FORBIDDEN)
        
        # if user.is_admin:
        #     workflows = WorkflowConfiguration.objects.filter(admin=user)
        if user.is_manager:
            workflows = WorkflowConfiguration.objects.filter(home_manager=user)
       
        associates = Associate.objects.filter(id__in=workflows.values_list('associate_id', flat=True))
        
        # Serialize the associate data
        serializer = AssociateDetailSerializer(associates, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class AssociatesUnderAdminView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user

        # Ensure the user has access (either admin or manager)
        if not (user.is_admin or user.is_manager):
            return Response({"detail": "Access denied"}, status=status.HTTP_403_FORBIDDEN)
        
        # If the user is both an admin and manager, retrieve associates from both roles
        if user.is_admin and user.is_manager:
            workflows = WorkflowConfiguration.objects.filter(
                Q(admin=user) | Q(home_manager=user)
            )
        elif user.is_admin:
            # Only admin workflows
            workflows = WorkflowConfiguration.objects.filter(admin=user)
        elif user.is_manager:
            # Only manager workflows
            workflows = WorkflowConfiguration.objects.filter(home_manager=user)
        
        # Retrieve unique associates from the workflows
        associate_ids = workflows.values_list('associate_id', flat=True).distinct()
        associates = Associate.objects.filter(id__in=associate_ids)
        
        # Serialize the associate data
        serializer = AssociateDetailSerializer(associates, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class AssociatesView(APIView):
    def get(self,request, id=None, format=None):
        associates = Associate.objects.all()
        serializer = AssociateViewSerializer(associates, many=True)
        if id is not None:
            associate = Associate.objects.get(id=id)
            serializer = AssociateViewSerializer(associate)
            config = WorkflowConfiguration.objects.filter(associate_id=id).first()
            config_serializer = WorkflowConfigurationSerializer(config)
            response_data = {
                'user_profile': serializer.data,
                'workflow_configuration': config_serializer.data
            }
            return Response(response_data)
        return Response(serializer.data)
    
# class UserProfileView(APIView):
#     permission_classes = [IsAuthenticated]

#     def get(self, request):
        
#         user_serializer = UserProfileSerializer(request.user)
        
#         user_id = user_serializer.data.get('id')

#         config = WorkflowConfiguration.objects.filter(associate_id=user_id).first()  # or `get` if it's a single object
        
#         config_serializer = WorkflowConfigurationSerializer(config)
        
#         response_data = {
#             'user_profile': user_serializer.data,
#             'workflow_configuration': config_serializer.data
#         }
        
#         return Response(response_data)