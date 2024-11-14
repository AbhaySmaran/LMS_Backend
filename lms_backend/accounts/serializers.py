from rest_framework import serializers
from .models import*

class AssociateViewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Associate
        fields = '__all__'
        extra_kwargs = {'password':{'write_only':True}}

    def create(self, validated_data):
        associate = Associate.objects.create_user(**validated_data)
        associate.save()
        return associate