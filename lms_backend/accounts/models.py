# models.py
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

class AssociateManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("The Email field must be set")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, password, **extra_fields)

class Associate(AbstractBaseUser):
    id = models.BigAutoField(primary_key=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100, blank=True)
    email = models.EmailField(unique=True,max_length=100)
    password = models.CharField(max_length=200)
    display_name = models.CharField(max_length=50, blank=True)
    associate_id = models.CharField(max_length=20, unique=True, blank=True, null=True)
    employee_title = models.CharField(max_length=50, blank=True)
    department = models.CharField(max_length=100, blank=True)
    company = models.CharField(max_length=50,default="Hyscaler")
    address = models.TextField(blank=True)
    city = models.CharField(max_length=50, blank=True)
    state = models.CharField(max_length=50, blank=True)
    country = models.CharField(max_length=50, blank=True)
    contact = models.CharField(max_length=20, blank=True)
    joining_date = models.DateField(auto_now_add=True)
    gender = models.CharField(max_length=10)
    is_manager = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name']

    objects = AssociateManager()

    def __str__(self):
        return self.email
    
    def save(self, *args, **kwargs):
        super(Associate, self).save(*args, **kwargs)
        if not self.associate_id and self.id:
            user_id = f"EMP00{self.id}"  
            Associate.objects.filter(id=self.id).update(associate_id = user_id)

        if not self.display_name:
            display_name = self.first_name  
            Associate.objects.filter(id=self.id).update(display_name = display_name)

        

class WorkflowConfiguration(models.Model):
    id = models.BigAutoField(primary_key=True)
    associate = models.ForeignKey(Associate, on_delete=models.CASCADE, related_name='workflow_associate')
    home_manager = models.ForeignKey(Associate, on_delete=models.SET_NULL, null=True, related_name='workflow_manager')
    admin = models.ForeignKey(Associate, on_delete=models.SET_NULL, null=True, related_name='workflow_admin')
    workflow_modification_date = models.DateTimeField(auto_now=True)
