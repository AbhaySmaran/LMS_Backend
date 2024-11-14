from django.db import models
from accounts.models import *


# Create your models here.
class Leave(models.Model):
    id = models.AutoField(primary_key=True)
    leave_type = models.CharField(max_length=100)
    leave_short_form = models.CharField(max_length=10)
    leave_count = models.IntegerField()
    updated_by = models.CharField(max_length=50)
    updated_on = models.DateField(auto_now_add=True)


class LeaveSetup(models.Model):
    id = models.BigAutoField(primary_key=True)
    associate_id = models.ForeignKey(Associate, on_delete=models.CASCADE)
    leave_year = models.IntegerField()
    leave_year_start = models.DateField()
    leave_year_end = models.DateField()
    casual_leave = models.FloatField()
    cl_carry = models.BooleanField(default=False)
    earned_leave = models.FloatField()
    el_carry = models.BooleanField(default=False)
    sick_leave = models.FloatField()
    sl_carry = models.BooleanField(default=False)
    paternity_leave = models.FloatField()
    pl_carry = models.BooleanField(default=False)
    maternity_leave = models.FloatField()
    ml_carry = models.BooleanField(default=False)
    loss_of_pay = models.FloatField()
    lop_carry = models.BooleanField(default=False)
    compensatory_off = models.FloatField()
    co_carry = models.BooleanField(default=False)
    child_adoption_leave = models.FloatField()
    cal_carry = models.BooleanField(default=False)
    updated_by = models.CharField(max_length=50)
    updated_on = models.DateField(auto_now_add=True)



class LeaveApplication(models.Model):
    application_id = models.AutoField(primary_key=True)
    associate = models.ForeignKey(Associate, on_delete=models.CASCADE,related_name='associate_leave_applications')
    leave_type = models.ForeignKey(Leave, on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    is_half_day = models.BooleanField(default=False)
    half_day_type = models.CharField(max_length=20, blank=True, null=True)
    no_of_days = models.FloatField()
    leave_remarks = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=10,default='Pending')
    leave_apply_date = models.DateTimeField(auto_now_add=True)
    leave_approve_date = models.DateField(blank=True, null=True)
    admin = models.ForeignKey(Associate,  on_delete=models.SET_NULL, blank=True,null=True,related_name='associates_admin')
    approve_by = models.CharField(max_length=10, blank=True, null=True)
    comments = models.TextField(blank=True, null=True)


    # def save(self, *args, **kwargs):
    #     super().save(*args, **kwargs)
    #     if not self.doc_uid:
            
    #         dept_code = self.department.dept_code
    #         unique_id = f"D{dept_code}{self.id}"
    #         Doctor.objects.filter(id=self.id).update(doc_uid=unique_id)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if not self.admin:
            associate_id = self.associate.id
            config = WorkflowConfiguration.objects.get(associate = associate_id)
            admin = config.admin.id
            LeaveApplication.objects.filter(associate = associate_id).update(admin = admin)




    def __str__(self):
        return f"Leave {self.leave_id} by {self.associate}"


class Holiday(models.Model):
    id = models.BigAutoField(primary_key=True)
    year = models.IntegerField()
    date = models.DateField()
    day = models.CharField(max_length=50, blank=True)
    holiday_name = models.CharField(max_length=50)