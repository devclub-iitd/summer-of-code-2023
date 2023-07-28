from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

from .models import Product


def index(request):
    latest_product_list = Product.objects.order_by("-addDate")[:5]
    template = loader.get_template("mydjangoapp/index.html")
    context = {
        "latest_product_list": latest_product_list,
    }
    return HttpResponse(template.render(context, request))

