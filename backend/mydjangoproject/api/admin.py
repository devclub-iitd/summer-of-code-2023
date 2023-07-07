from django.contrib import admin
from .models import Product

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['id','name', 'price', 'available','user', 'purchased_by', 'available']
    list_filter = ['available']

