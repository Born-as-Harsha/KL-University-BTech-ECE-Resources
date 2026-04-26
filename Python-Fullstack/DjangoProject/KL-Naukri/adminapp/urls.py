from django.urls import path
from . import views

urlpatterns = [
    path('',views.adminapphomepage,name='adminapphomepage'),
    path('printer/',views.printer,name='printer'),
    path('timetable/',views.timetable,name='timetable'),
    path('time1/',views.time1,name='time1'),
    path('signup/',views.signup,name='signup'),
    path('weather1/',views.weather,name='weather1'),
    path('login/', views.login, name='login'),
    path('feedback_view/',views.feedback_view,name='feedback_view'),

]