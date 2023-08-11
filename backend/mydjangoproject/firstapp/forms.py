from django import forms
from .models import Product
from django.contrib.auth.models import User

class f1(forms.ModelForm):
    class Meta:
        model = Product
        fields = ["name", "description",'price',]
        labels = {'name': 'Name', 'description': 'Description', 'price': 'Price'}
class lo(forms.Form):
    username = forms.CharField(max_length=150,label='Username')
    password = forms.CharField(max_length=40,widget=forms.PasswordInput,label='Password')
    
class re(forms.Form):
   username = forms.CharField(max_length=150)
   password = forms.CharField(max_length=40,widget=forms.PasswordInput)
    