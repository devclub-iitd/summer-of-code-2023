from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("products/<int:product_id>", views.detail, name="detail"),
    path('add-product', views.AddProductView.as_view(), name='add_product')
]