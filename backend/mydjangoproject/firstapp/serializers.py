from rest_framework import serializers
from .models import Product
from django.contrib.auth.models import User

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields =['id','name', 'description', 'price']

class UserCreateSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only = True, required = True, style={ "input_type": "password"})
    
    class Meta:
        model = User
        fields = ['username','email','password']
    
    
