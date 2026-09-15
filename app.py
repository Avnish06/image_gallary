from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
from werkzeug.utils import secure_filename
import os
import json
# main.py
from utils.find_image import find_image     


app = Flask(__name__)
CORS(app)

# upload folder 

UPLOAD_FOLDER = os.path.join(app.root_path, 'static', 'uploads')
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

# json file for permanant storage

Images_file = os.path.join(app.root_path, "images.json")

if os.path.exists(Images_file):
    with open(Images_file, 'r') as f:
        images = json.load(f)
else:
    images = []

# save images to json file

def save_images():
    with open(Images_file, 'w') as f:
        json.dump(images, f, indent=4)

# Allowed image extensions

allowed_extensions = {'png', 'jpg', 'jpeg'}

def extension_allow(filename):
    return ("." in filename and filename.rsplit(".", 1)[1].lower() in allowed_extensions
            )



@app.route('/')
def index():
    return render_template('index.html')

@app.route('/images', methods=['GET'])
def get_images():
    return jsonify(images)

@app.route('/upload', methods=['POST'])
def upload_image():
    if 'file' not in request.files:
        return jsonify({"error": "No file part"}), 400
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "No selected file"}), 400

    filename = secure_filename(file.filename)
    if not filename:
        return jsonify({"error": "Invalid filename"}), 400

    if not extension_allow(filename):
        return jsonify({"error": "File type not allowed"
    }), 400
    

    new_file_index = find_image(filename, images)
    if new_file_index != -1:
        return jsonify({"error": "File already exists"}), 400
    
    
    filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    file.save(filepath)
    
    image_url = f"/static/uploads/{filename}"
    images.append({"title": filename, "url": image_url})
    
    return jsonify({"message": "Image uploaded!", "url": image_url}), 201

if __name__ == '__main__':
    app.run(debug=True)
