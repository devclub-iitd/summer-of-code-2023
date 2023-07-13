from django.urls import path
from . import views

from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from .views import (
    apiOverviewAPIView,
    productListAPIView,
    productDetailAPIView,
    productAddAPIView,
    productDeleteAPIView,
    productDeleteAPIView,
    signupAPIView
)

from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi


schema_view = get_schema_view(
	openapi.Info(
		title="API Docs",
		default_version='v1',
		description="Ecommerce",
		terms_of_service="https://www.google.com/policies/terms/",
		contact=openapi.Contact(email="contact@xyz.local"),
		license=openapi.License(name="BSD License"),
	),
	public=True,
	permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
	path('', apiOverviewAPIView.as_view(), name="api-overview"),
	path('product-list/', productListAPIView.as_view(), name="product-list"),
	path('product-detail/<str:pk>/', productDetailAPIView.as_view(), name="product-detail"),
	path('product-add/', productAddAPIView.as_view(), name="product-add"),

	path('product-delete/<str:pk>/', productDeleteAPIView.as_view(), name="product-delete"),
    path('product-purchase/<str:pk>/', productDeleteAPIView.as_view(), name="product-purchase"),
    
	path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('signup/', signupAPIView.as_view(), name="signup"),
    
	path('swagger<format>/', schema_view.without_ui(cache_timeout=0), name='schema-json'),
	path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
]