from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('courses/', views.courses, name='courses'),
    path('faculty/', views.faculty, name='faculty'),
    path('students/', views.students, name='students'),
]