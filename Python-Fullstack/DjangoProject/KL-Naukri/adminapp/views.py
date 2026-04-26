from django.shortcuts import render, redirect
import pytz
from datetime import datetime
from .forms import  UserForm, FeedbackForm

# Home Page
def adminapphomepage(request):
    return render(request, 'adminapp/projecthomepage.html')


# Printer Page
def printer(request):
    user_input = ""
    if request.method == "POST":
        user_input = request.POST.get('klu')

    a1 = {'klu': user_input}
    return render(request, 'adminapp/printer.html', a1)


# Timetable Page
def timetable(request):
    return render(request, 'adminapp/timetable.html')


# Timezone Page
def time1(request):
    klu = None
    time = None

    if request.method == "POST":
        klu = request.POST.get("klu")

        try:
            # Case insensitive match
            for tz_name in pytz.all_timezones:
                if tz_name.lower() == klu.lower():
                    klu = tz_name
                    break

            tz = pytz.timezone(klu)
            current_time = datetime.now(tz)
            time = current_time.strftime("%Y-%m-%d %H:%M:%S")

        except:
            time = "Invalid Timezone!"

    return render(request, "adminapp/time1.html", {
        "klu": klu,
        "time": time
    })


# Signup Page
def signup(request):
    if request.method == "POST":
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('adminapphomepage')  # URL name in urls.py
    else:
        form = UserForm()

    return render(request, 'adminapp/signup.html', {'form': form})

import requests
def weather(request):
    weather_data = {}
    error_message = ""
    if request.method == "POST":
        city = request.POST.get('city')
        api_key = "fa278824893df4de3d0a9fc8d27f4eea"
        url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"
        response = requests.get(url).json()
        if "main" in response:
            weather_data = {
                "city": city,
                "temperature": response["main"]["temp"],
                "description": response["weather"][0]["description"],
                "humidity": response["main"]["humidity"]
            }
        else:
            error_message = "Wrong Input / No City Found"
    return render(request, "adminapp/weather.html", {
        "weather": weather_data,
        "error": error_message
    })
    return render(request, 'adminapp/weather.html')

def login(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            user = UserAccount.objects.get(email=email, password=password)
            # Store user info in session manually since we are using a custom model
            request.session['user_id'] = user.id
            request.session['user_role'] = user.role
            request.session['user_name'] = user.firstname

            if user.role == 'employer':
                return redirect('employee_home')
            elif user.role == 'jobseeker':
                return redirect('jobseekerhomepage')
            else:
                return redirect('adminapphomepage')
        except UserAccount.DoesNotExist:
            return render(request, 'adminapp/login.html', {'error': 'Invalid Email or Password'})
    return render(request, 'adminapp/login.html')

from django.shortcuts import render
from django.core.mail import send_mail

def feedback_view(request):
    if request.method == "POST":
        form = FeedbackForm(request.POST)

        if form.is_valid():
            feedback = form.save()

            # ✅ Safe email sending (no crash)
            try:
                send_mail(
                    subject="Feedback Submitted Successfully",
                    message=(
                        f"Dear {feedback.student_name},\n\n"
                        "Thank you for submitting feedback "
                        "for your course at KL University.\n\n"
                        "Your response has been recorded successfully.\n\n"
                        "- KL University"
                    ),
                    from_email='amdeepakv@gmail.com',
                    recipient_list=[feedback.student_email],
                    fail_silently=True
                )
            except Exception as e:
                print("Email error:", e)

            return render(request, "adminapp/success.html")

    else:
        form = FeedbackForm()

    return render(request, "adminapp/feedback_form.html", {"form": form})