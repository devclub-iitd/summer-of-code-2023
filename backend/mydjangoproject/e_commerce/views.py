from django.shortcuts import render
from django.http import HttpResponse
from e_commerce.models import Product
from django.template import loader
from django.contrib.auth import authenticate, login,logout
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth.forms import UserCreationForm

def visit(request):
    template = loader.get_template("visit.html")
    # print(Product.objects.all())
    print(request.user.is_authenticated)
    context ={"ls":list(Product.objects.all())}
    return HttpResponse(template.render(context, request))

@csrf_protect
def login_page(request):
    if(request.method=='POST'):
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('visit')
        else:
            return redirect('login')
    else:
        return HttpResponse(render(request,"login.html",{}))

def logout_page(request):
    logout(request)
    return redirect('visit')
@csrf_protect
def sign_up(request):
    if(request.method=="POST"):
        form=UserCreationForm(request.POST)
        if(form.is_valid()):
            form.save()
            username=form.cleaned_data['username']
            password=form.cleaned_data['password1']
            user=authenticate(username=username,password=password)
            login(request,user)
            return redirect('visit')
        else:
            return redirect('sign_up')
    form=UserCreationForm()
    return render(request,'signup.html',{'form':form})

@csrf_protect
def add_product(request):
    if(not request.user.is_authenticated):
        return redirect('login')
    if(request.method=='POST'):
        product=Product(name=request.POST.get("name"),description=request.POST.get("description"),price=request.POST.get("price"))
        product.save()
        return redirect('add_product')
    return render(request,'add_product.html',{})










#API
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import ProductSerializer
from rest_framework import status

@api_view(['GET'])
def get_all(request):
    product = Product.objects.all()
    serializer = ProductSerializer(product, many=True)
    return Response(serializer.data)
@api_view(['GET'])
def get_one(request):
    id= request.query_params.get('id')
    if(id):
        try:
            product = Product.objects.filter(id=id)[0]
        except:
            return Response([])
    else:
        return Response('Invalid request please attach product id', status=status.HTTP_400_BAD_REQUEST)
    serializer = ProductSerializer(product, many=False)
    return Response(serializer.data)
@api_view(['POST'])
def post_one(request):
    if(not request.user.is_authenticated):
        return Response('Please Login First', status=status.HTTP_400_BAD_REQUEST)
    serializer = ProductSerializer(data=request.data)
    if serializer.is_valid():
        # serializer.update(creator=request.user.id)
        print(request.user.id,serializer)
        product=Product(name=serializer.data['name'],description=serializer.data['description'],price=serializer.data['price'],creator=request.user.id)
        product.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
@api_view(['PUT'])
def buy_one(request):
    if(not request.user.is_authenticated):
        return Response('Please Login First', status=status.HTTP_400_BAD_REQUEST)
    id=request.data['id']
    ls=Product.objects.filter(id=id)
    if(len(ls)==0):
        return Response('id does not exist', status=status.HTTP_400_BAD_REQUEST)
    ls=ls[0]
    if(ls['creator']==request.user.id):
        return Response("creator can't buy his own stuff", status=status.HTTP_400_BAD_REQUEST)
    if request.user.id in ls['buyer']:
        return Response("already bought", status=status.HTTP_400_BAD_REQUEST)
    ls['buyer'].append(request.user.id);ls.save()
    return Response("Mission accomplished", status=status.HTTP_201_CREATED)
@api_view(['DELETE'])
def del_one(request):
    if(not request.user.is_authenticated):
        return Response("Please login first",status=status.HTTP_400_BAD_REQUEST)
    id=request.data['id']
    ls=Product.objects.filter(id=id)
    if(len(ls)==0):
        return Response('the product not in the database',status=status.HTTP_204_NO_CONTENT)
    ls=ls[0]
    if(ls['creator']==request.user.id):
        ls.delete()
        return Response('Mission accomplished',status=status.HTTP_204_NO_CONTENT)
    return Response("Only the creator can delete the item",status=status.HTTP_400_BAD_REQUEST)