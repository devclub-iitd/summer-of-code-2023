from django.db import models
import uuid
# Create your models here.
class Product(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField(max_length=50)
    descr = models.TextField(max_length=400)
    price = models.IntegerField()
    def __str__(self):
        return self.name
