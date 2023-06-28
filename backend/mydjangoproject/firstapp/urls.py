from django.urls import path
from . import views

urlpatterns = [
    path("add/",views.add,name='add'),
    path('',views.all,name='all')
]