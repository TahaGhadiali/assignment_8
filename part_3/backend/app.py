from flask import Flask, request, jsonify
import os
import json

app = Flask(__name__)
DATA_FILE = 'submissions.json'

@app.route('/', methods=['POST'])
def route():
    data = request.form

    username = data.get('username')
    age = data.get('age')

    # Load existing data
    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, 'r') as f:
            try:
                submissions = json.load(f)
            except json.JSONDecodeError:
                submissions = []
    else:
        submissions = []

    # Append new data
    submissions.append({"username": username, "age": age})

    # Save back to JSON file
    with open(DATA_FILE, 'w') as f:
        json.dump(submissions, f, indent=4)

    return jsonify({"message": "Data received", "username": username, "age": age})

if __name__ == '__main__':
    if not os.path.exists(DATA_FILE):
        with open(DATA_FILE, 'w') as f:
            json.dump([], f)
    app.run(host='0.0.0.0', port=5000, debug=True)
