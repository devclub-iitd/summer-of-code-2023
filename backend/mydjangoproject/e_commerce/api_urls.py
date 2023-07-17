from django.urls import path
from . import views
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

urlpatterns=[
    path('product',views.ProductList.as_view({'get':'list'}),name='get_all'),
    path('product/<int:id>/',views.ProductList.as_view({'get': 'retrieve'}),name='get_one'),
    path('add/',views.ProductList.as_view({'post':'create'}),name='add'),
    path('delete/<int:id>/',views.ProductList.as_view({'delete':'destroy'}),name='delete'),
    path('buy/<int:id>/',views.ProductList.as_view({'put':'update'}),name='buy'),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('apilogin',views.log_in,name='apilogin'),
]