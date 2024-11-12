from django.db import models
from accounts.models import Associate
from accounts.models import Associate

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
    casual_leave = models.IntegerField()
    cl_carry = models.BooleanField(default=False)
    earned_leave = models.IntegerField()
    el_carry = models.BooleanField(default=False)
    sick_leave = models.IntegerField()
    sl_carry = models.BooleanField(default=False)
    paternity_leave = models.IntegerField()
    pl_carry = models.BooleanField(default=False)
    maternity_leave = models.IntegerField()
    ml_carry = models.BooleanField(default=False)
    loss_of_pay = models.IntegerField()
    lop_carry = models.BooleanField(default=False)
    compensatory_off = models.IntegerField()
    co_carry = models.BooleanField(default=False)
    child_adoption_leave = models.IntegerField()
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
    no_of_days = models.DecimalField(max_digits=5, decimal_places=1)
    leave_remarks = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=10,default='Pending')
    leave_apply_date = models.DateField(auto_now_add=True)
    leave_approve_date = models.DateField(blank=True, null=True)
    # approval_id = models.CharField(max_length=10, blank=True, null=True)
    admin = models.ForeignKey(Associate,  on_delete=models.SET_NULL, blank=True,null=True,related_name='associates_admin')
    approve_by = models.CharField(max_length=10, blank=True, null=True)
    comments = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"Leave {self.leave_id} by {self.associate}"


class Holiday(models.Model):
    id = models.BigAutoField(primary_key=True)
    year = models.IntegerField()
    date = models.DateField()
    day = models.CharField(max_length=50, blank=True)
    holiday_name = models.CharField(max_length=50)