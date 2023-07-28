from django.db import models
from django.contrib.auth.models import User

class Product(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=8, decimal_places=2)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='add_product')
    purchased_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name='purchased_products')
    available = models.BooleanField(default=True)

    def __str__(self):
        return self.name

    def purchase(self, user):
        if self.available:
            if self.user == user:
                return 'You cannot purchase your own product.'
            if self.purchased_by is not None:
                return 'This product has already been purchased.'
            self.purchased_by = user
            self.available = False
            self.save()
            return 'Product purchased successfully.'
        else:
            return 'This product is not available for purchase.'
