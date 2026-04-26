from django.shortcuts import render
import requests

def home(request):
    weather_data = {}
    error_message = None

    if request.method == "POST":
        city = request.POST.get('city')

        api_key = "e0211bdfc81369aefb32cab7dd0b5fdc"
        url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"

        response = requests.get(url)
        data = response.json()

        if response.status_code == 200:
            weather_data = {
                "city": data["name"],
                "temperature": data["main"]["temp"],
                "condition": data["weather"][0]["description"],
                "humidity": data["main"]["humidity"]
            }
        else:
            error_message = data["message"]

    return render(request, "weather.html", {"weather": weather_data, "error": error_message})