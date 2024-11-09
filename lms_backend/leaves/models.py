from django.db import models

# Create your models here.
class Leave(models.Model):
    id = models.AutoField(primary_key=True)
    leave_type = models.CharField(max_length=100)
    leave_short_form = models.CharField(max_length=10)
    leave_count = models.IntegerField()
    updated_by = models.CharField(max_length=50)
    updated_on = models.DateField(auto_now_add=True)


class LeaveSetup(models.Model):
    associate_id = models.CharField(max_length=10)
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