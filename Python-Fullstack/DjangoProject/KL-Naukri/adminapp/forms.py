from django import forms
from .models import useraccount, StudentFeedback


class UserForm(forms.ModelForm):
    class Meta:
        model = useraccount
        fields = ['firstname', 'lastname', 'email', 'phonenumber', 'role']

class FeedbackForm(forms.ModelForm):
    class Meta:
        model = StudentFeedback
        fields = [
            'student_name','student_email','course_name','faculty_name','rating','comments'
        ]
