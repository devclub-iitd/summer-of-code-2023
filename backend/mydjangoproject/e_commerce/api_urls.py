from django.urls import path
from . import views
urlpatterns=[
    path('',views.get_all,name='get_all'),
    path('find',views.get_one,name='get_one'),
    path('post',views.post_one,name='post'),
    path('delete',views.del_one,name='delete'),
    path('buy',views.buy_one,name='buy'),
]