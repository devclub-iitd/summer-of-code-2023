from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from .views import (
    get_all_products,
    get_product,
    add_product,
    delete_product,
    purchase_product,
    signup
)

urlpatterns = [
    path('products/', get_all_products, name='get_all_products'),
    path('products/<int:product_id>/', get_product, name='get_product'),
    path('products/add/', add_product, name='add_product'),
    path('products/<int:product_id>/delete/', delete_product, name='delete_product'),
    path('products/<int:product_id>/purchase/', purchase_product, name='purchase_product'),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/signup/', signup, name='signup'),
]
