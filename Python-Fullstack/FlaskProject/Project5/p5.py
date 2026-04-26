from flask import *
import psycopg2

app = Flask(__name__)
app.secret_key = "123"

# Database connection
conn = psycopg2.connect(
    database="PFSD",
    user='postgres',
    password='1234',
    host='127.0.0.1',
    port='5432'
)

cur = conn.cursor()

# ❌ COMMENTED (Table already exists)
# cur.execute('''CREATE TABLE IF NOT EXISTS STUDENTD(
#     REGNUM INT PRIMARY KEY,
#     NAME VARCHAR(50) NOT NULL,
#     SUBJECT1 VARCHAR(50),
#     SUBJECT2 VARCHAR(50)
# )''')
# conn.commit()

print("Connected to database successfully........")

# Home page → form
@app.route('/')
def next1():
    return render_template('try12.html')

# Add student
@app.route('/add_student', methods=['GET', 'POST'])
def add_student():
    if request.method == 'POST':
        regnum = request.form.get('regnum', type=int)
        name = request.form.get('name')
        subject1 = request.form.get('subject1')
        subject2 = request.form.get('subject2')

        try:
            cur.execute(
                "INSERT INTO STUDENTD (REGNUM, NAME, SUBJECT1, SUBJECT2) VALUES (%s, %s, %s, %s)",
                (regnum, name, subject1, subject2)
            )
            conn.commit()

            flash('Student Added Successfully!')
            return render_template('success.html')

        except Exception as e:
            conn.rollback()
            return f"Error: {e}"

    return redirect('/')

# Run app
if __name__ == "__main__":
    app.run(debug=True)