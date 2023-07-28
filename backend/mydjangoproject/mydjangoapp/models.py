from django.db import models

class Product(models.Model):
    name = models.CharField(max_length=200)
    description = models.CharField(max_length=1000)
    price = models.IntegerField(default=0)
    addDate = models.DateTimeField("date added")
    sold = models.BooleanField(default=False)
    image = models.ImageField(upload_to="product_images/")

    def get_string(self):
        return str(self.id)+" - "+self.name
    
    def isSold(self):
        return self.sold