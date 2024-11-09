from rest_framework import serializers
from .models import*

class AssociateViewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Associate
        fields = '__all__'
        extra_kwargs = {'password':{'write_only':True}}