from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.http import Http404
from .models import Product
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as auth_login, logout as logout_user
from django.contrib.auth.decorators import login_required


def index(request):
    product_list = Product.objects.all()
    context = {"product_list": product_list}
    return render(request, "firstApp/index.html", context)


def detail(request, id):
    try:
        product = Product.objects.get(pk=id)
    except Product.DoesNotExist:
        raise Http404("Product does not exist")
    return render(request, "firstApp/detail.html", {"product": product})


def signup(request):
    if request.method == 'POST':
        uname = request.POST.get('username')
        email1 = request.POST.get('email')
        passw = request.POST.get('password')
        my_user = User.objects.create_user(username=uname, email=email1, password=passw)
        my_user.save()
        return redirect('loginPage')
    return render(request, "firstApp/signup.html")


def login(request):
    if request.method == 'POST':
        uname = request.POST.get('username')
        passw = request.POST.get('password')
        user = authenticate(request, username=uname, password=passw)
        if user is not None:
            auth_login(request, user)
            return redirect('index')
        else:
            return HttpResponse("Kuch bhi mat daal")
    return render(request, "firstApp/login.html")


def logout(request):
    logout_user(request)
    return redirect('index')

@login_required(login_url='loginPage')
def save_product(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        desc = request.POST.get('description')
        price = request.POST.get('price')
        p = Product(name=name, description=desc, price=price)
        p.save()
        return redirect('index')
    return render(request, "firstApp/saveProduct.html")