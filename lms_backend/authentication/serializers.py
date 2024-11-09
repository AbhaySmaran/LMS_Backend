from rest_framework import serializers
from accounts.models import *

class UserLoginSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(max_length=255)

    class Meta:
        model = Associate
        fields = ['email', 'password', "is_admin", "is_manager"]
        extra_kwargs = {'is_admin': {'read_only': True},'is_manager': {'read_only': True}}

class UserProfileSerializer(serializers.ModelSerializer):
    # role = serializers.SerializerMet/hodField()

    class Meta:
        model = Associate
        # fields = ["id", "email", "first_name", "last_name", "is_manager", "is_admin"]
        fields = '__all__'
        extra_kwargs = {'password': {'write_only': True}}


    

class AssociateDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Associate
        fields = ["id", "first_name","associate_id", "last_name", "email", "employee_title", "department"]


class WorkflowConfigurationSerializer(serializers.ModelSerializer):
    associate = AssociateDetailSerializer()
    home_manager = AssociateDetailSerializer()
    admin = AssociateDetailSerializer()
    class Meta:
        model = WorkflowConfiguration
        fields = '__all__'