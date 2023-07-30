from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.edit import FormView
from django.http import HttpResponse
from django.template import loader

from .forms import ProductForm
from .models import Product


def index(request):
    latest_product_list = Product.objects.order_by("-addDate")[:5]
    template = loader.get_template("mydjangoapp/index.html")
    context = {
        "latest_product_list": latest_product_list,
        "user": request.user
    }
    return HttpResponse(template.render(context, request))

def detail(request, product_id):
    template = loader.get_template("mydjangoapp/detail.html")
    product = get_object_or_404(Product, id=product_id)
    return render(request, 'mydjangoapp/detail.html', {'product': product, 'user': request.user})


class AddProductView(LoginRequiredMixin, FormView):
    template_name = 'mydjangoapp/add_product.html'
    form_class = ProductForm
    success_url = '/'  # Replace '/' with your desired URL

    def form_valid(self, form):
        # Save the product with the logged-in user as the owner
        product = form.save(commit=False)
        product.owner = self.request.user
        product.save()
        return redirect(self.success_url)  # Redirect to success URL

    def form_invalid(self, form):
        # Log the form errors for debugging purposes
        print(form.errors.as_data())
        return super().form_invalid(form)