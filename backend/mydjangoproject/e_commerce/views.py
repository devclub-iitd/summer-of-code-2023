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

from .serializers import ProductSerializer,SignUpSerializer
from rest_framework import status
import json
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated


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
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def buy_one(request):
    try:
        id=json.loads(request.body.decode('utf-8'))['id']
    except:return Response('Invalid Input', status=status.HTTP_400_BAD_REQUEST)
    ls=Product.objects.filter(id=id)
    if(len(ls)==0):
        return Response('id does not exist', status=status.HTTP_400_BAD_REQUEST)
    ls=ls[0]
    if(ls.creator==request.user.id):
        return Response("creator can't buy his own stuff", status=status.HTTP_400_BAD_REQUEST)
    if request.user.id in ls.buyers:
        return Response("already bought", status=status.HTTP_400_BAD_REQUEST)
    ls.buyers.append(request.user.id);ls.save()
    return Response("Mission accomplished", status=status.HTTP_201_CREATED)
@api_view(['POST'])
def log_in(request):
    try:username,password=request.data['username'],request.data['password']
    except:return Response('Authorization token absent',status=status.HTTP_401_UNAUTHORIZED)
    # print(username,password)
    user=authenticate(username=username,password=password)
    print(user)
    if(user is None):
        return Response('invalid authorization',status=status.HTTP_400_BAD_REQUEST)
    refresh = RefreshToken.for_user(user)
    return Response({'refresh': str(refresh), 'access': str(refresh.access_token)},status=status.HTTP_202_ACCEPTED)
@api_view(['POST'])
def signup(request):
    serializer = SignUpSerializer(data=request.data)
    if serializer.is_valid():
        user = serializer.save()
        refresh = RefreshToken.for_user(user)
        return Response({'refresh': str(refresh), 'access': str(refresh.access_token)})
    return Response(serializer.errors, status=400)

from e_commerce.serializers import ProductSerializer
from rest_framework import viewsets
from rest_framework import permissions
class ProductList(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    queryset = Product.objects.all()
    serializer_class =ProductSerializer
    lookup_field='id'
    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        print(instance.creator,request.user.id)
        if(request.user.id==instance.creator):
            return super().destroy(request, *args, **kwargs)
        else:
            return Response('only creator can destroy an object',status=status.HTTP_400_BAD_REQUEST)
    def create(self, request, *args, **kwargs):
        instance=self.get_object()
        instance.creator=request.user.id
        instance.buyers=[]
        instance.save()
        return Response('the product has been created',status=status.HTTP_201_CREATED)
    def update(self, request, *args, **kwargs):
        instance=self.get_object()
        if(request.user.id==instance.creator):
            return Response("creator can't buy his own",status=400)
        if(request.user.id in instance.buyers):
            return Response('Already Bought',status=400)
        instance.buyers.append(request.user.id)
        instance.save()
        return Response('Item bought',status=status.HTTP_202_ACCEPTED)