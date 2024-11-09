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
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=200)
    display_name = models.CharField(max_length=50)
    associate_id = models.CharField(max_length=20, unique=True)
    employee_title = models.CharField(max_length=50, blank=True)
    department = models.CharField(max_length=100, blank=True)
    company = models.CharField(max_length=50)
    address = models.TextField(blank=True)
    city = models.CharField(max_length=50, blank=True)
    state = models.CharField(max_length=50, blank=True)
    country = models.CharField(max_length=50, blank=True)
    contact = models.CharField(max_length=20, blank=True)
    joining_date = models.DateField()
    gender = models.CharField(max_length=10, blank=True)
    is_manager = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name']

    objects = AssociateManager()

    def __str__(self):
        return self.email

class WorkflowConfiguration(models.Model):
    id = models.BigAutoField(primary_key=True)
    associate = models.ForeignKey(Associate, on_delete=models.CASCADE, related_name='workflow_associate')
    home_manager = models.ForeignKey(Associate, on_delete=models.SET_NULL, null=True, related_name='workflow_manager')
    admin = models.ForeignKey(Associate, on_delete=models.SET_NULL, null=True, related_name='workflow_admin')
    workflow_modification_date = models.DateTimeField(auto_now=True)
