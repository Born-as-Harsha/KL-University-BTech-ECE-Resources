from django.shortcuts import render, redirect
from .forms import *
from .models import JobseekerProfile

def jobseekerhomepage(request):
    return render(request,'jobseekerapp/jobseekerhomepage.html')

def addprofile(request):
    if request.method == 'POST':
        form = jobseekerprofileform(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('profilelist')
    else:
        form = jobseekerprofileform()
    return render(request, 'jobseekerapp/addprofile.html',{'form':form})

def profilelist(request):
    profiles = JobseekerProfile.objects.all()
    return render(request,'jobseekerapp/profilelist.html',{'profiles':profiles})