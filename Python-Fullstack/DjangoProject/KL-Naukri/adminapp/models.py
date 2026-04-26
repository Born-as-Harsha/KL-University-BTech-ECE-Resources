from django.db import models

# Create your models here.
class useraccount(models.Model):
    ROLE_CHOICES = [
        ('employer', 'Employer'),
        ('jobseeker', 'Job seeker'),
    ]
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    email = models.EmailField(primary_key=True)
    phonenumber = models.CharField(max_length=10)
    role = models.CharField(max_length=20, choices=ROLE_CHOICES)
    def __str__(self):
        return self.firstname

class StudentFeedback(models.Model):
    student_name = models.CharField(max_length=100)
    student_email = models.EmailField()
    course_name = models.CharField(max_length=100)
    faculty_name = models.CharField(max_length=100)
    rating = models.IntegerField()
    comments = models.TextField()
    submitted_on = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.student_name

