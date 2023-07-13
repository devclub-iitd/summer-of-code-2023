from django.db import models
from django.contrib.auth.models import User


class Product(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=8, decimal_places=2)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_products')
    purchased_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name='purchased_products')
    is_available = models.BooleanField(default=True)


    def __str__(self):
        return self.name
    
    def purchase(self, user):
        self.purchased_by = user
        self.is_available = False
        self.save()