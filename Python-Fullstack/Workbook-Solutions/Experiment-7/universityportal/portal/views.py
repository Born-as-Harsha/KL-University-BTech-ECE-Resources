from django.shortcuts import render

def home(request):
    return render(request, 'home.html')

def courses(request):
    return render(request, 'courses.html')

def faculty(request):
    return render(request, 'faculty.html')

def students(request):
    return render(request, 'students.html')