from .models import Product
from rest_framework import serializers

 
class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model=Product
        fields=('name','description','price')
class IdSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()