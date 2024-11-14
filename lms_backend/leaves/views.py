from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from .models import *
from .serializers import *
from django.db.models import Case, When, Value, IntegerField


from django.core.mail import send_mail
from django.conf import settings
from django.core.mail import EmailMessage

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

    def get(self,request,id = None):
        applications = LeaveApplication.objects.filter(associate = request.user).annotate(
            status_order=Case(
                When(status='Pending', then=Value(0)),
                When(status='Approved', then=Value(1)),
                When(status='Rejected', then=Value(2)),
                When(status='Cancelled', then=Value(3)),
                output_field=IntegerField(),
            )
        ).order_by('status_order')
        serializer = LeaveApplicationViewSerializer(applications, many=True)
        return Response(serializer.data)
    
    def post(self,request):
        data = request.data.copy()
        data['associate'] = request.user.id
        serializer = LeaveApplicationSerializer(data = data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()

            leave_reason = serializer.data.get('leave_remarks')

            no_of_days = float(serializer.data.get('no_of_days'))
            leave_type = serializer.data.get('leave_type')
            leave = Leave.objects.get(id = leave_type)
            leave_name = leave.leave_type
            formatted_leave_name = leave_name.lower().replace(" ", "_")
            
            associate_id = serializer.data.get('associate')
            leaveSetupRecord = LeaveSetup.objects.get(associate_id = associate_id)
            remaining_days = getattr(leaveSetupRecord, formatted_leave_name, None)

            workConfig = WorkflowConfiguration.objects.get(associate = associate_id)
            manager_id = workConfig.home_manager.id
            manager  = Associate.objects.get(id = manager_id)
            manager_mail = manager.email

            # print(manager_id)
            

            # print(manager_id,manager,manager_mail)
            
            new_remaining_days = remaining_days - no_of_days
            setattr(leaveSetupRecord, formatted_leave_name, new_remaining_days)
            leaveSetupRecord.save()

            # Send email notification
            email_subject = "Leave Application Submitted"
            email_body = f"""
            Dear {request.user.first_name},

            Your leave application for {leave_name} has been successfully submitted.
            Number of days: {no_of_days}
            Remaining {leave_name} days: {new_remaining_days}

            Thank you.
            """
            send_mail(
                subject=email_subject,
                message=email_body,
                from_email=settings.EMAIL_HOST_USER,
                recipient_list=[request.user.email],  
                fail_silently=True,
            )



            manager_email = manager_mail
            email_subject_manager = "New Leave Application Submitted"
            email_body_manager = f"""
            Dear Manager,

            {request.user.first_name} {request.user.last_name} has submitted a leave application.
            Leave Type: {leave_name}
            Number of days: {no_of_days}
            leave reason: {leave_reason}
            Please review the application.

            Thank you.
            """
            send_mail(
                subject=email_subject_manager,
                message=email_body_manager,
                from_email=settings.EMAIL_HOST_USER,
                recipient_list=[manager_email],
                fail_silently=True,
            )


            return Response({"msg":"Application submitted"})
        return(serializer.errors)
    
class LeaveApplicationsListView(APIView):
    def get(self,request,id):
        applications = LeaveApplication.objects.filter(associate = id, status = "Pending")
        user_serializer = LeaveApplicationViewSerializer(applications, many=True)
        return Response(user_serializer.data)

class LeaveApplicationUpdateView(APIView):

    def put(self,request,id):
        application = LeaveApplication.objects.get(application_id=id)
        serializer = LeaveApplicationSerializer(application, data = request.data, partial = True)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            no_of_days = float(serializer.data.get('no_of_days'))
            leave_type = serializer.data.get('leave_type')
            leave = Leave.objects.get(id = leave_type)
            leave_name = leave.leave_type
            formatted_leave_name = leave_name.lower().replace(" ", "_")
            
            associate_id = serializer.data.get('associate')
            leaveSetupRecord = LeaveSetup.objects.get(associate_id = associate_id)
            remaining_days = getattr(leaveSetupRecord, formatted_leave_name, None)

            associate = Associate.objects.get(id=associate_id)
            associate_mail = associate.email
            
            
            if (request.data.get('status')=="Rejected" or request.data.get('status')=="Cancelled"):
                new_remaining_days = remaining_days + no_of_days
                setattr(leaveSetupRecord, formatted_leave_name, new_remaining_days)
                leaveSetupRecord.save()
            
            if request.data.get('status')=="Approved":
                email_subject = "Leave Application Approved"
                email_body = f"""
                Dear {associate.first_name},

                Your leave application for {leave_name} has been approved.
                Remaining {leave_name} days: {remaining_days}

                Thank you.
                """
                send_mail(
                    subject=email_subject,
                    message=email_body,
                    from_email=settings.EMAIL_HOST_USER,
                    recipient_list=[associate_mail],  
                    fail_silently=True,
                )

            
            return Response(serializer.data)

        return Response(serializer.errors)


class HolidayView(APIView):
    def get(self,request):
        holidays = Holiday.objects.all()
        serializer = HolidaySerializer(holidays, many=True)

        holiday_list = {}

        for holiday in holidays:
            holiday_list[str(holiday.date)] = holiday.day

        return Response(holiday_list)
    

class PendingLeaveApplications(APIView):
    def get(self,request):
        applications = LeaveApplication.objects.filter(status = "Pending")
        serializer = LeaveApplicationSerializer(applications, many=True)

        appliction_list = {}
        for application in applications:
            appliction_list[str(application.associate.id)] = application.status
        return Response(appliction_list)



class StatisticsView(APIView):
    def get(self,request):
        user = request.user.id
        print(user)
        associates = Associate.objects.all().count()
        admins = Associate.objects.filter(is_admin=True).count()
        managers = Associate.objects.filter(is_manager=True).count()
        pending_applications= LeaveApplication.objects.filter(associate = user, status = "Pending").count()
        
        return Response({
            "associates":associates,
            "admins":admins,
            "managers":managers,
            "pending_applications":pending_applications
        })