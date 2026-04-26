from flask import Flask, render_template
import pandas as pd
import matplotlib
matplotlib.use('Agg')   # ✅ FIX HERE
import matplotlib.pyplot as plt
import os

app = Flask(__name__)

@app.route('/')
def home():
    data = {
        'Name': ['A', 'B', 'C', 'D'],
        'Marks': [85, 70, 90, 60]
    }

    df = pd.DataFrame(data)

    if not os.path.exists('static'):
        os.makedirs('static')

    plt.figure()
    plt.bar(df['Name'], df['Marks'])
    plt.title('Student Performance')
    plt.xlabel('Students')
    plt.ylabel('Marks')

    plt.savefig('static/chart.png')
    plt.close()

    return render_template('index.html')

if __name__ == '__main__':
    print("Flask Started")
    app.run(debug=True)