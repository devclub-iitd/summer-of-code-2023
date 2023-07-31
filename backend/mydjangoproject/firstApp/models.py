from django.db import models

# Create your models here.
class Product(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    description = models.CharField(max_length=500)
    price = models.IntegerField(default=0)