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
    
class LeaveSetupUpdateAPIView(APIView):
    def post(self, request, *args, **kwargs):
       
        data = request.data
        if not isinstance(data, list):
            return Response({"error": "Data should be a list of records."}, status=status.HTTP_400_BAD_REQUEST)
        
        errors = []
        for record in data:
            # Get the instance to update based on ID
            try:
                instance = LeaveSetup.objects.get(id=record.get('id'))
            except LeaveSetup.DoesNotExist:
                errors.append({"id": record.get('id'), "error": "Record not found."})
                continue

            # Partial update for each instance
            serializer = LeaveSetupSerializer(instance, data=record, partial=True)
            if serializer.is_valid():
                serializer.save()
            else:
                errors.append({"id": record.get('id'), "error": serializer.errors})

        if errors:
            return Response({"errors": errors}, status=status.HTTP_400_BAD_REQUEST)

        return Response({"message": "Data updated successfully"}, status=status.HTTP_200_OK)


# class LeaveSetupUpdateOrCreateAPIView(APIView):
#     def post(self, request, *args, **kwargs):
        
#         data = request.data
#         if not isinstance(data, list):
#             return Response({"error": "Data should be a list of records."}, status=status.HTTP_400_BAD_REQUEST)
        
#         errors = []
#         for record in data:
#             # Check if ID is provided and try to retrieve the instance for update
#             instance = None
#             if 'id' in record:
#                 try:
#                     instance = LeaveSetup.objects.get(id=record['id'])
#                 except LeaveSetup.DoesNotExist:
#                     # If record not found for given ID, ignore and create a new instance
#                     instance = None

#             # If instance exists, it will be updated; otherwise, a new one will be created
#             serializer = LeaveSetupSerializer(instance, data=record, partial=True)
#             if serializer.is_valid():
#                 serializer.save()
#             else:
#                 errors.append({"id": record.get('id'), "error": serializer.errors})

#         if errors:
#             return Response({"errors": errors}, status=status.HTTP_400_BAD_REQUEST)

#         return Response({"message": "Data updated or created successfully"}, status=status.HTTP_200_OK)





# class LeaveSetupUpdateOrCreateAPIView(APIView):
#     def post(self, request, *args, **kwargs):
#         # Expecting an array of dictionaries for bulk add or update
#         data = request.data
#         if not isinstance(data, list):
#             return Response({"error": "Data should be a list of records."}, status=status.HTTP_400_BAD_REQUEST)
        
#         errors = []
#         success_ids = []

#         for record in data:
#             instance = None
#             if 'id' in record:
#                 try:
#                     instance = LeaveSetup.objects.get(id=record['id'])
#                 except LeaveSetup.DoesNotExist:
#                     # ID does not exist, instance will remain None to create a new record
#                     pass

#             # Create a new instance if not found or update existing
#             serializer = LeaveSetupSerializer(instance, data=record, partial=True)
#             if serializer.is_valid():
#                 saved_instance = serializer.save()
#                 success_ids.append(saved_instance.id)  # Collect the ID of created/updated record
#             else:
#                 errors.append({"id": record.get('id'), "error": serializer.errors})

#         if errors:
#             return Response({"success": success_ids, "errors": errors}, status=status.HTTP_207_MULTI_STATUS)

#         return Response({"message": "Data updated or created successfully", "success": success_ids}, status=status.HTTP_200_OK)




class LeaveSetupUpdateOrCreateAPIView(APIView):
    def post(self, request, *args, **kwargs):
        data = request.data
        if not isinstance(data, list):
            return Response({"error": "Data should be a list of records."}, status=status.HTTP_400_BAD_REQUEST)
        
        errors = []
        success_ids = []

        for record in data:
            print("record data:", record)
            instance = None
            if 'id' in record:
                try:
                    # Try to get the existing instance
                    instance = LeaveSetup.objects.get(id=record['id'])
                    print(f"Updating record with ID {record['id']}")
                except LeaveSetup.DoesNotExist:
                    # ID does not exist; proceed with creating a new record
                    print(f"Creating new record as ID {record['id']} does not exist.")

            # Create or update using the serializer
            serializer = LeaveSetupSerializer(instance, data=record, partial=True)
            if serializer.is_valid():
                saved_instance = serializer.save()
                success_ids.append(saved_instance.id)  # Collect ID of created/updated record
            else:
                errors.append({"id": record.get('id'), "error": serializer.errors})

        if errors:
            return Response({"success": success_ids, "errors": errors}, status=status.HTTP_207_MULTI_STATUS)

        return Response({"message": "Data updated or created successfully", "success": success_ids}, status=status.HTTP_200_OK)



# class LeaveSetupUpdateOrCreateAPIView(APIView):
#     def post(self, request, *args, **kwargs):
#         data = request.data
#         if not isinstance(data, list):
#             return Response({"error": "Data should be a list of records."}, status=status.HTTP_400_BAD_REQUEST)
        
#         errors = []
#         success_ids = []

#         for record in data:
#             print("Processing record:", record)
#             instance = None
#             if 'id' in record:
#                 try:
#                     # Try to get the existing instance based on the ID
#                     instance = LeaveSetup.objects.get(id=record['id'])
#                     print(f"Updating record with ID {record['id']}")
#                 except LeaveSetup.DoesNotExist:
#                     # ID does not exist, so proceed with creating a new record
#                     print(f"Creating new record for ID {record['id']}")

#             # Create or update using the serializer
#             serializer = LeaveSetupSerializer(instance, data=record, partial=True)
#             if serializer.is_valid():
#                 saved_instance = serializer.save()  # This will either update or create
#                 success_ids.append(saved_instance.id)  # Collect the ID of the created/updated record
#             else:
#                 errors.append({"id": record.get('id'), "error": serializer.errors})

#         if errors:
#             return Response({"success": success_ids, "errors": errors}, status=status.HTTP_207_MULTI_STATUS)

#         return Response({"message": "Data updated or created successfully", "success": success_ids}, status=status.HTTP_200_OK)


class LeaveSetupView(APIView):
    def get(self,request):
        leaveSetupData = LeaveSetup.objects.all()

        serializer = LeaveSetupSerializer(leaveSetupData, many=True)
        return Response(serializer.data)

    def put(self,request):
        id = request.data.get('id')
        user = LeaveSetup.objects.filter(associate_id = id)
        serializer = LeaveSetupUpdateSerializer(user, data = request.data, partial=True)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response({"msg":"Leave count changed"})
        return Response(serializer.errors)
    

class LeavesData(APIView):
    def get(self, request, *args, **kwargs):
        leave_setup_data = Leave.objects.all()

        leave_data_dict = {}
        for leave in leave_setup_data:
            leave_data_dict[leave.leave_short_form] = leave.leave_count

        return Response(leave_data_dict, status=status.HTTP_200_OK)



class LeaveApplicationView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self,request):
        applications = LeaveApplication.objects.filter(associate = request.user)
        serializer = LeaveApplicationSerializer(applications, many=True)
        return Response(serializer.data)
    
    def post(self,request):
        serializer = LeaveApplicationSerializer(data = request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response({"msg":"Application submitted"})
        return(serializer.errors)
    



class HolidayView(APIView):
    def get(self,request):
        holidays = Holiday.objects.all()
        serializer = HolidaySerializer(holidays, many=True)

        holiday_list = {}

        for holiday in holidays:
            holiday_list[str(holiday.date)] = holiday.day

        return Response(holiday_list)