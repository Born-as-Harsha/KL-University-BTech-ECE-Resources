from django import forms
from .models import JobseekerProfile

class jobseekerprofileform(forms.ModelForm):
    class Meta:
        model = JobseekerProfile
        fields = ['name','qualification','hobbies','skills','address','profile_photo']