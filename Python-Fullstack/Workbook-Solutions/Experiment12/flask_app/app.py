from flask import Flask, render_template, request

app = Flask(__name__)

# Home route
@app.route('/')
def home():
    return render_template('home.html')

# Department route
@app.route('/department')
def department():
    dept_info = {
        "name": "Electrical and electronic communication Engineering",
        "hod": "Dr. Harshavardhan",
        "students": 60
    }
    return render_template('department.html', dept=dept_info)

# User input route
@app.route('/greet', methods=['GET', 'POST'])
def greet():
    if request.method == 'POST':
        name = request.form['name']
        return render_template('greet.html', username=name)
    return render_template('greet.html', username=None)

if __name__ == '__main__':
    app.run(debug=True)