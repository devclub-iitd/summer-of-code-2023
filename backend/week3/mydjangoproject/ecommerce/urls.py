from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("<int:product_id>/", views.productDetailView, name="productDetailView"),
    path("list/",views.productlistView, name = "productlistview"),
    path("register/",views.registerView,name = "registerView"),
    path("createProductView/",views.createProductView,name = "createProductView"),
    path("getallproducts/",views.getallproducts,name = "getallproducts"),
    path("getasingleproduct/<int:pk>/",views.getasingleproduct,name = "getasingleproduct"),
    path("addaproduct/",views.addaproduct,name = "addaproduct"),
    path("deleteaproduct/<int:pk>/",views.deleteaproduct,name = "deleteaproduct"),
    path("purchaseaproduct/<int:pk>/",views.purchaseaproduct,name = "purchaseaproduct"),
    path("apiforsignup/",views.apiforsignup,name = "apiforsignup"),

]