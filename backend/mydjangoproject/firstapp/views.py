from django.shortcuts import render,redirect
from django.http import HttpResponse,request
from django.template import loader
from .models import Product,Sales
from .forms import f1,lo,re
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import ProductSerializer,UserCreateSerializer
from django.http import JsonResponse
import json
import datetime
from rest_framework import permissions, response,decorators,status
from rest_framework_simplejwt.tokens import RefreshToken,Token,AccessToken

def home(request):
     return render(request,'index.html')

@api_view(['GET'])
def viewone(request,id):
    
     
     if  Product.objects.filter(pk= id).exists():
        product = Product.objects.get(pk= id)
        serializer = ProductSerializer(product)
     else:
          return Response(data= 'Enter Valid Id')

     return Response(serializer.data)
     
'''@login_required'''
''' current_user = request.user'''
@api_view(['POST'])
@decorators.permission_classes([permissions.IsAuthenticated])
def add(request):
     
     serializer = ProductSerializer(data = request.data)
     if serializer.is_valid():
          serializer.save()
          product=Product.objects.last()
          product.user = request.user
          product.save()
          return Response(serializer.data)
     return Response(serializer.errors)

    
@api_view(['DELETE'])
@decorators.permission_classes([permissions.IsAuthenticated])
def deletep(request,id):
     product = Product.objects.get(id = id)
     print(product.user,request.user)
     if product.user == request.user:
          
          product.delete()
          return Response('DELETED')
     return Response("Unauthorized")
     
@api_view(['POST'])
@decorators.permission_classes([permissions.IsAuthenticated])
def purchase(request):
     data = json.loads(request.body)
     
     id = data['id']
     product = Product.objects.filter(id = id)
     
     check = Product.objects.filter(id=id).values_list('availability')
     print(check)
     if check[0][0] == 'Available':
          
          d = product.values_list('name','description','price')
          print(d)
          Sales.objects.create(name = d[0][0],price=d[0][2],description = d[0][1],dt = datetime.datetime.now())

          
          Product.objects.filter(id =id).update(availability = 'Unavailable')
          return Response('BOUGHT')
     return Response('Unavailable')
     



    
        
        
    
@api_view(['GET'])
def all(request):
    products = Product.objects.all()
    serializer = ProductSerializer(products,many = True)
    '''template = loader.get_template('products.html')'''
    '''context = {
        'products': products
    }
    return HttpResponse(template.render(context,request))'''
    return Response(serializer.data)
@api_view(['POST'])
@decorators.permission_classes([permissions.AllowAny])
def register(request):
     serializer = UserCreateSerializer(data=request.data)
     d=request.data
        
        
     if serializer.is_valid():
          email = d['email']
          username = d['username']
          if User.objects.filter(username = username).exists():
               return Response('Username already exists')
          user=User(username=username,email=email)
          user.set_password(d['password'])
          user.save()
          refresh = RefreshToken.for_user(user)
          res = {
               "refresh": str(refresh),
               "access": str(refresh.access_token),
          }
          return response.Response(res,status.HTTP_201_CREATED)
     else:
          return Response(serializer.errors)

        
            
           
        
          

            
    

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

def to(request):
     return render(request,'timeout.html')

def logout__(request):
    logout(request)
    return redirect('/login')
     
                




