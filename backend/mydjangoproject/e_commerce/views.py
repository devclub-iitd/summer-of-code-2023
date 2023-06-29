from django.shortcuts import render
from django.http import HttpResponse
from e_commerce.models import Product
from django.template import loader

def visit(request):
    template = loader.get_template("visit.html")
    print(Product.objects.all())
    context ={"ls":list(Product.objects.all())}
    return HttpResponse(template.render(context, request))