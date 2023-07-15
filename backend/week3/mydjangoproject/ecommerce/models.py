from django.db import models

# Create your models here.
class product(models.Model):
    productIndex = models.IntegerField(default=0)
    productName = models.CharField(max_length=200)
    productPrice = models.IntegerField(default=0)
    productDescription = models.CharField(max_length=200)
    def __str__(self):
        return self.productName