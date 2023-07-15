from rest_framework import serializers
from .models import product
from django.contrib.auth.models import User


class ProductSerializers(serializers.ModelSerializer):
    class Meta:
        model = product
        fields = "__all__"

class UserSerializer(serializers.ModelSerializer):
    username = serializers.CharField(
            )
    password = serializers.CharField()

    def create(self, validated_data):
        user = User.objects.create_user(validated_data['username'],
             validated_data['password'])
        return user
    class Meta:
        model = User
        fields = ('id', 'username', 'password')