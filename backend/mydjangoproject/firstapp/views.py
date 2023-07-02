from django.shortcuts import render,redirect
from django.http import HttpResponse,request
from django.template import loader
from .models import Product
from .forms import f1,lo,re
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required
def add(request):
    
    current_user = request.user

    if request.method == 'POST':
        form = f1(request.POST)
        
        
        if form.is_valid():
            x = Product(user = current_user,name =form.cleaned_data['name'],description=form.cleaned_data['description'],price = form.cleaned_data['price'])
            x.save()
            
    else:
        form = f1()
    form = f1()
    return render(request, 'form.html', {'form': form})
def all(request):
    products = Product.objects.all().values()
    template = loader.get_template('products.html')
    context = {
        'products': products
    }
    return HttpResponse(template.render(context,request))
def register(request):
    form = re()
    if request.method == 'POST':
        form = re(request.POST)
        
        
        if form.is_valid():
               username =form.cleaned_data['username']
               password = form.cleaned_data['password']
               user = User.objects.filter(username =username)
               if user :
                   messages.error(request,'User already Exists')
                   return render(request,'registration/register.html',{'form': form})
               user = User.objects.create_user(username)
               user.set_password(password)
               user.save()
               messages.success(request,'Account Created')
               return redirect('/product')
        
            
           
        
    form=re()      

            
    
    return render(request,'registration/register.html',{'form': form})
def login__(request):
    if request.method == "POST":
        form = lo(request.POST)
        if form.is_valid():
               username =form.cleaned_data['username']
               password = form.cleaned_data['password']
               user = User.objects.filter(username =username)
               if user.exists() is False:
                    messages.error(request,'Invalid Username')
                    return redirect('/login')
               user = authenticate(username = username, password = password)

               if user is None:
                    messages.error(request,'Invalid Password')
                    return redirect('/login')
               else:
                    login(request,user)
                    return redirect('/product')

               
    form = lo()
    return render(request,'registration/login.html',{'form':lo})

def logout__(request):
    logout(request)
    return redirect('/login')
     
                




