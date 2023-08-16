from .models import Product
from rest_framework import serializers
from django.contrib.auth.models import User
 
class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model=Product
        fields=('name','description','price')
class IdSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField()
class SignUpSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    def create(self, validated_data):
        user = User.objects.create_user(
            username=validated_data['username'],
            password=validated_data['password']
        )
        return user

    class Meta:
        model = User
        fields = ('username', 'password')
