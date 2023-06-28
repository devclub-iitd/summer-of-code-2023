from django.shortcuts import render
from django.http import HttpResponse,request
from django.template import loader
from .models import Product
from .forms import f1

# Create your views here.
def add(request):
    if request.method == 'POST':
        form = f1(request.POST)
        
        if form.is_valid():
            form.save()
            
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

