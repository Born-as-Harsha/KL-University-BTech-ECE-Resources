from django.urls import path
from . import views

urlpatterns = [
    path('', views.student_profile, name='home'),
    path('profile/', views.student_profile, name='profile'),
    path('academics/', views.academic_details, name='academics'),
]