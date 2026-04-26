from django.urls import path
from . import views

urlpatterns = [
    path('jobseekerhomepage/', views.jobseekerhomepage, name='jobseekerhomepage'),
    path('addprofile/', views.addprofile, name='addprofile'),
    path('profilelist/', views.profilelist, name='profilelist')
]