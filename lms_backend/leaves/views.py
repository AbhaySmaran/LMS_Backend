from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from .models import *
from .serializers import *

class LeavesView(APIView):
    def get(self,request):
        leaves = Leave.objects.all()
        serializer = LeavesSerializer(leaves, many=True)
        return Response(serializer.data)

    def post(self,request):
        serializer = LeavesSerializer(data = request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)