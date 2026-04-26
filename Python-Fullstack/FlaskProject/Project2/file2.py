from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('Harsha2.html')

@app.route('/l', methods=['POST'])
def login():
    uname = request.form['uname']
    passwrd = request.form['pass']

    if uname == "Harsha" and passwrd == "2007":
        return render_template('welcome.html', name=uname)  # ✅ professional
    else:
        return "<h1 style='color:red;text-align:center;'>Wrong Username and Password</h1>"

if __name__ == '__main__':
    app.run(debug=True)