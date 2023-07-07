from django.urls import path,include
from . import views

urlpatterns = [
    path("product/add/",views.add,name='add'),
    path('product/',views.all,name='all'),
    path('register',views.register,name='register'),
    path('login',views.login__,name='login'),
    path('logout',views.logout__,name='logout'),
    path('accounts/',include('django.contrib.auth.urls')),
    path('',views.home,name='home'),
    path('timeout',views.to,name='timeout'),
    path('product/<int:id>/',views.viewone,name='viewone'),
    path('product/delete/<int:id>/',views.deletep,name='delete'),
    path('product/purchase',views.purchase,name='Purchase')
]