from django import forms
from .models import Product

class f1(forms.ModelForm):
    class Meta:
        model = Product
        fields = ["name", "description",'price',]
        labels = {'name': 'Name', 'description': 'Description', 'price': 'Price'}