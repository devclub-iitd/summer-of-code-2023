# from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse

def index(request):
    return HttpResponse("<h1>Hii</h1>")
def greet(request, name):
    return HttpResponse(f"Greetings! {name}")