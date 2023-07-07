from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Product(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE,default=1)
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=500)
    price = models.IntegerField()
    availability = models.CharField(max_length=255,default='Available')

class Sales(models.Model):
    user = models.ForeignKey(User,on_delete=models.SET_DEFAULT,default=1)
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=500)
    price = models.IntegerField()
    dt = models.DateTimeField()