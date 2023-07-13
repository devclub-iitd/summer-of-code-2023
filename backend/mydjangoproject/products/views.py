from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth.forms import UserCreationForm

from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout

from django.contrib import messages

from django.contrib.auth.decorators import login_required

from .models import Product
from .forms import ProductForm, CreateUserForm


def index(request):
    product_list = Product.objects.all()
    context = {"product_list": product_list}
    return render(request, "products/index.html", context)

def detail(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    return render(request, "products/detail.html", {"product": product})

def login(request):
    if request.user.is_authenticated:
        return redirect('index')
    else:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')

            user = authenticate(request, username=username, password=password)

            if user:
                auth_login(request, user)
                return redirect('index')
            else:
                messages.info(request, 'Username or password is incorrect')
        context = {}
        return render(request, "products/login.html", context)

def signup(request):
    if request.user.is_authenticated:
        return redirect('index')
    else:
        form = CreateUserForm()


        if request.method == 'POST':
            form = CreateUserForm(request.POST)
            if form.is_valid():
                form.save()

        context = {'form': form}
        return render(request, "products/signup.html", context)

def logout(request):
    auth_logout(request)
    return redirect('login')

@login_required(login_url='login')
def add_products(request):
    form = ProductForm()


    if request.method == 'POST':
        form = ProductForm(request.POST)
        if form.is_valid():
            form.save()

    context = {'form': form}
    return render(request, "products/add_products.html", context)