from django.shortcuts import render
from .forms import FeedbackForm

def feedback_form(request):

    if request.method == 'POST':
        form = FeedbackForm(request.POST)

        if form.is_valid():
            form.save()
            return render(request, 'success.html')

    else:
        form = FeedbackForm()

    return render(request, 'feedback.html', {'form': form})