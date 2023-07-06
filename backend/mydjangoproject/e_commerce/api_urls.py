from django.urls import path
from . import views
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

urlpatterns=[
    path('',views.get_all,name='get_all'),
    path('find',views.get_one,name='get_one'),
    path('post',views.post_one,name='post'),
    path('delete',views.del_one,name='delete'),
    path('buy',views.buy_one,name='buy'),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('login',views.log_in,name='login'),
]