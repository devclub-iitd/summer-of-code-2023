from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login,authenticate
from django.http import Http404
from django.http import HttpResponse
from django.template import loader
from .models import product
from .forms import mymodelform
from django.contrib.auth.decorators import login_required
from .serializers import ProductSerializers,UserSerializer
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view,permission_classes
from rest_framework.permissions import IsAuthenticated

def index(request):
    latest_product_list = product.objects.all()
    template = loader.get_template("ecommerce/index.html")
    context = {
        "latest_product_list": latest_product_list,
    }
    return HttpResponse(template.render(context, request))

def productDetailView(request, product_id):
    try:
        item = product.objects.get(pk = product_id)
    except:
        raise Http404("Product does not exist.")
    return render(request, "ecommerce/detail.html",{"product":item})

def productlistView(request):
    return HttpResponse("You're at product list view.")

def registerView(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            # username = form.cleaned_data.get('username')
            # rawpassword = form.cleaned_data.get('password1')
            # user = authenticate(username=username, password=rawpassword)
            # login(request, user)
            form.save()
            print("registered")
            return redirect('/ecommerce/')
        else: 
            print("cannot register")

    else:
        form = UserCreationForm()
        print("ye kya hua")
    context = {'form':form}
    return render(request,'ecommerce/register.html',context)

@login_required
def createProductView(request):
    if request.method == "POST":
        form = mymodelform(request.POST)
        if form.is_valid:
            form.save()
            messages.success("created product successfully!!")
            return redirect("ecommerce/addproducts.html")
    else :
        form = mymodelform()
    return render(request,"ecommerce/addproducts.html",{'form':form})

# Create your views here.
@api_view(["GET"])
def getallproducts(request):
    if(request.method=='GET'):
        products = product.objects.all()
        serializers = ProductSerializers(products,many = True)
        return Response(serializers.data)

@api_view(["GET"])
def getasingleproduct(request,pk):
    try:
        products = product.objects.get(pk = pk)
    except product.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == "GET":
        serializers = ProductSerializers(products)
        return Response(serializers.data)

@api_view(["PUT"])
@permission_classes((IsAuthenticated, ))
def addaproduct(request):
    if request.method == 'PUT':
        serializers = ProductSerializers(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data)
        return Response(serializers.errors,status=status.HTTP_400_BAD_REQUEST)

@api_view(["DELETE"])
@permission_classes((IsAuthenticated, ))
def deleteaproduct(request,pk):
    try:
        products = product.objects.get(pk=pk)
    except product.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'DELETE':
        products.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(["GET"])
@permission_classes((IsAuthenticated, ))
def purchaseaproduct(request,pk):
    try:
        products = product.objects.get(pk=pk)
    except product.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        products.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(["POST"])
def apiforsignup(request):
    if request.method == "POST":
        serializers = UserSerializer(data =request.data)
        if(serializers.is_valid()):
            serializers.save()
            return Response(serializers.data,status=status.HTTP_201_CREATED)
        return Response(serializers.errors,status=status.HTTP_400_BAD_REQUEST)
#kya bewakoofi hai serializers ke chakkar me django rest use karna pad gaya hai....