from rest_framework import serializers
from .models import *

class LeavesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Leave
        fields = '__all__'

    def create(self,validated_data):
        return Leave.objects.create(**validated_data)