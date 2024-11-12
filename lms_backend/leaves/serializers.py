from rest_framework import serializers
from .models import *
from django.db.models import QuerySet

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


class LeaveSetupViewSerializer(serializers.ModelSerializer):
    class Meta:
        model = LeaveSetup
        

class LeaveApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = LeaveApplication
        fields = '__all__'

    def create(self,validated_data):
        return LeaveApplication.objects.create(**validated_data)
    


class HolidaySerializer(serializers.ModelSerializer):
    class Meta:
        model = Holiday
        fields = ['id','date','day']