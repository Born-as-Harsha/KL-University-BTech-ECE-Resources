import time
from datetime import datetime
import pytz
from flask import *

app = Flask(__name__)

@app.route('/')
def welcome():
    return render_template('try1.html')

@app.route('/', methods=['POST'])
def function1():
    list1 = ["Asia/Kabul","Europe/Tirane","Australia/Sydney","Asia/Kolkata","Europe/London"]
    i = request.form.get("operation")
    if i in list1:
        time1 = pytz.timezone(i)
        time2 = datetime.now(time1)
        return render_template('try2.html', t=time2)
    else:
        return "Error"

# datetime.datetime.now()

if __name__ == '__main__':
    app.run(debug=True)