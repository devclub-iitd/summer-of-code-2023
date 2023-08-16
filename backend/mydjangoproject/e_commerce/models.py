from django.db import models
from django.contrib.postgres.fields import ArrayField
# Create your models here.
class Product(models.Model):
    name=models.CharField(max_length=100,default="")
    description=models.CharField(max_length=255,default="")
    price=models.IntegerField(default=0)
    buyers=ArrayField(models.PositiveIntegerField())
    creator=models.PositiveIntegerField(default=0)
    def __str__(s):
        return 'Name:'+s.name+'<br>Description:'+s.description+'<br>Price:'+str(s.price)
