"""
URL configuration for mydjangoproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from django.contrib.auth.models import User
from rest_framework import routers, serializers, viewsets
from . import views


# ----------------- Routing


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include("mydjangoapp.urls")),
    path('signup', views.signup, name='signup'),
    path('login', auth_views.LoginView.as_view(template_name='mydjangoapp/login.html'), name='login'),
    path('logout', auth_views.LogoutView.as_view(), name='logout')
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)



