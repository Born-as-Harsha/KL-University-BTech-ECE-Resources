from flask import Flask, render_template

Harsha = Flask(__name__)

@Harsha.route('/')
def hello():
    return '<h1 style="color:blue;">Hello, World!</h1>'

@Harsha.route('/function1')
def function1():
    return '<h1 style="color:green;">Welcome To PFSD Class</h1>'

@Harsha.route('/fun2')
def fun2():
    return render_template('Frontend1.html')  # ✅ fixed

if __name__ == '__main__':
    Harsha.run(debug=True)