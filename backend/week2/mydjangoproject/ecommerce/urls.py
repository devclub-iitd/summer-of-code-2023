from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("<int:product_id>/", views.productDetailView, name="productDetailView"),
    path("list/",views.productlistView, name = "productlistview"),
    path("register/",views.registerView,name = "registerView"),
    path("addproducts/",views.createProductView,name = "createProductView"),
]