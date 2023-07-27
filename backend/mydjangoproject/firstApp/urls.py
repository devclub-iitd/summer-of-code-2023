from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("login/", views.login, name="loginPage"),
    path("signup/", views.signup, name="signup"),
    path("save_product", views.save_product, name="save_product"),
    path("logout/", views.logout, name="logout"),
    path("<int:id>/", views.detail, name="detail"),
]
