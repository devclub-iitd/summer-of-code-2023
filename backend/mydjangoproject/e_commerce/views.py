from django.shortcuts import render
from django.http import HttpResponse
def visit(request):
    return HttpResponse("Thanks for visiting the app")
# Create your views here.
