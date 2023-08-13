from django import forms
from .models import product

class mymodelform(forms.ModelForm):
  class Meta:
    model = product
    fields = ["productIndex", "productName","productPrice","productDescription"]
    labels = {"productIndex":"productIndex", "productName":"productName","productPrice":"productPrice","productDescription":"productDescription"}