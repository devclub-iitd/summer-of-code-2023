from django.urls import path
from . import views

from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
	path('', views.apiOverview, name="api-overview"),
	path('product-list/', views.productList, name="product-list"),
	path('product-detail/<str:pk>/', views.productDetail, name="product-detail"),
	path('product-add/', views.productAdd, name="product-add"),

	path('product-delete/<str:pk>/', views.productDelete, name="product-delete"),
    path('product-purchase/<str:pk>/', views.productPurchase, name="product-purchase"),
    
	path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('signup/', views.signup, name="signup")
]