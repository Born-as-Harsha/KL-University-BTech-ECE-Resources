from flask import Flask, jsonify
import json
import os

app = Flask(__name__)
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True

def load_students():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(base_dir, "student.json")
    
    with open(file_path, "r") as file:
        students = json.load(file)
    
    return students


@app.route('/')
def home():
    return "<h1>Students API is running. Go to /students</h1>"


@app.route('/students')
def get_students():
    students = load_students()
    return jsonify(students)


@app.route('/students/<int:student_id>')
def get_student(student_id):
    students = load_students()
    
    for student in students:
        if student.get("id") == student_id:
            return jsonify(student)
    
    return jsonify({"error": "Student not found"}), 404


if __name__ == '__main__':
    app.run(debug=True)