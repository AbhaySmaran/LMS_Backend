from rest_framework import serializers
from .models import *
from django.db.models import QuerySet
from accounts.serializers import *

class LeavesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Leave
        fields = '__all__'

    def create(self,validated_data):
        return Leave.objects.create(**validated_data)

class LeaveSetupSerializer(serializers.ModelSerializer):
    class Meta:
        model = LeaveSetup
        fields = '__all__'

    def create(self, validated_data):
        return LeaveSetup.objects.create(**validated_data)
    
    # def update(self, instance, validated_data):
    #     # Custom logic for updating a record, if needed
    #     return super().update(instance, validated_data)

    def update(self, instance, validated_data):
        print("Validated data for update:", validated_data)  

        # Proceed with updating each field
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        
        # Save the updated instance to the database
        instance.save()
        return instance
    
class LeaveSetupUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = LeaveSetup
        fields = '__all__'

    def update(self, instance, validated_data):
        
        if isinstance(instance, QuerySet):
            for obj in instance:
                for attr, value in validated_data.items():
                    setattr(obj, attr, value)
                obj.save()
        else:
           
            for attr, value in validated_data.items():
                setattr(instance, attr, value)
            instance.save()

        return instance





class LeaveApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = LeaveApplication
        fields = '__all__'

    def create(self,validated_data):
        return LeaveApplication.objects.create(**validated_data)
    
    def update(self,instance,validated_data):
        instance.status = validated_data.get('status',instance.status)
        instance.approve_by = validated_data.get('approve_by',instance.approve_by)
        instance.leave_approve_date = validated_data.get('leave_approve_date',instance.leave_approve_date)
        instance.save()
        return instance


class LeaveApplicationViewSerializer(serializers.ModelSerializer):
    leave_type = LeavesSerializer()
    associate = AssociateViewSerializer()
    class Meta:
        model = LeaveApplication
        fields = '__all__'

    def update(self,instance,validated_data):
        instance.status = validated_data.get('status',instance.status)
        instance.approve_by = validated_data.get('approve_by',instance.approve_by)
        instance.leave_approve_date = validated_data.get('leave_approve_date',instance.leave_approve_date)
        instance.save()
        return instance



class HolidaySerializer(serializers.ModelSerializer):
    class Meta:
        model = Holiday
        fields = ['id','date','day']


class EmailSerializer(serializers.Serializer):
    subject = serializers.CharField(max_length=255)
    message = serializers.CharField()
    recipient = serializers.EmailField()
    cc = serializers.ListField(
        child=serializers.EmailField(),
        required=False,
        allow_empty=True 
    )
    bcc = serializers.ListField(
        child=serializers.EmailField(),
        required=False,
        allow_empty=True
    )