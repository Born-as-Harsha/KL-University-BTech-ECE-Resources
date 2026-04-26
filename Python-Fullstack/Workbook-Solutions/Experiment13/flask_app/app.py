from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/students')
def students():
    data = [
        {"id": 1, "name": "HarshaVardhan", "course": "ECE"},
        {"id": 2, "name": "Nivesh", "course": "CSE"},
        {"id": 3, "name": "Charan", "course": "Peer Mentor"},
        {"id": 4, "name": "Aksith", "course": "CSE"}
    ]
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)