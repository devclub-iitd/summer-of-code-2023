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
