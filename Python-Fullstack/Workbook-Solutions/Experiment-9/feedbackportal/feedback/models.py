from django.db import models

class Feedback(models.Model):
    student_name = models.CharField(max_length=100)
    course_name = models.CharField(max_length=100)
    comments = models.TextField()
    rating = models.IntegerField()

    def __str__(self):
        return self.student_name