from django.urls import path
from . import views
urlpatterns=[path("",views.visit,name="visit"),path("login",views.login_page,name="login"),path("sign_up",views.sign_up,name="sign_up")]