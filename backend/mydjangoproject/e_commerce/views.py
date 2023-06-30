from django.shortcuts import render
from django.http import HttpResponse
from e_commerce.models import Product
from django.template import loader
from django.contrib.auth import authenticate, login
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth.forms import UserCreationForm

def visit(request):
    template = loader.get_template("visit.html")
    print(Product.objects.all())
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