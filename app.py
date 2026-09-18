import json
import os
import uuid
from datetime import datetime, timezone
from pathlib import Path
from flask import Flask, jsonify, render_template, request
from flask_cors import CORS
from werkzeug.utils import secure_filename

ALLOWED_EXTENSIONS = {"png", "jpg", "jpeg", "gif"}
IMAGE_SIGNATURES = {
    "png": (b"\x89PNG\r\n\x1a\n",),
    "gif": (b"GIF87a", b"GIF89a"),
    "jpg": (b"\xff\xd8\xff",),
    "jpeg": (b"\xff\xd8\xff",),
}


def create_app(upload_root=None, images_file=None):
    app = Flask(__name__)
    CORS(app)

    upload_root = Path(upload_root or os.path.join(app.root_path, "static", "uploads"))
    images_file = Path(images_file or os.path.join(app.root_path, "images.json"))

    app.config["UPLOAD_FOLDER"] = str(upload_root)
    app.config["IMAGES_FILE"] = str(images_file)
    upload_root.mkdir(parents=True, exist_ok=True)

    if images_file.exists():
        try:
            with images_file.open("r", encoding="utf-8") as file:
                images = json.load(file)
        except (json.JSONDecodeError, OSError):
            images = []
    else:
        images = []

    if not isinstance(images, list):
        images = []

    def save_images():
        with images_file.open("w", encoding="utf-8") as file:
            json.dump(images, file, indent=4)

    def extension_allow(filename):
        return "." in filename and filename.rsplit(".", 1)[1].lower() in ALLOWED_EXTENSIONS

    def is_image_content(content, extension):
        return any(content.startswith(signature) for signature in IMAGE_SIGNATURES[extension])

    def get_sorted_images():
        return sorted(images, key=lambda item: int(item.get("id", 0)), reverse=True)

    def resolve_allowed_path(file_name):
        if not file_name or Path(file_name).name != file_name:
            return None

        target_path = (upload_root / file_name).resolve()
        upload_root_resolved = upload_root.resolve()
        if upload_root_resolved not in target_path.parents:
            return None
        return target_path

    @app.route("/")
    def index():
        return render_template("index.html")

    @app.route("/images", methods=["GET"])
    @app.route("/images/all", methods=["GET"])
    @app.route("/all", methods=["GET"])
    def get_images():
        return jsonify(get_sorted_images())

    @app.route("/images", methods=["POST"])
    @app.route("/upload", methods=["POST"])
    def upload_image():
        if "file" not in request.files:
            return jsonify({"error": "No file part"}), 400

        uploaded_file = request.files["file"]
        if uploaded_file.filename == "":
            return jsonify({"error": "No selected file"}), 400

        filename = uploaded_file.filename
        if not filename or filename in {".", ".."}:
            return jsonify({"error": "Invalid filename"}), 400

        safe_name = secure_filename(filename)
        if safe_name != filename or Path(filename).name != filename:
            return jsonify({"error": "Invalid filename"}), 400

        if not extension_allow(filename):
            return jsonify({"error": "Unsupported image type"}), 400

        extension = filename.rsplit(".", 1)[1].lower()
        content = uploaded_file.read()
        if not content:
            return jsonify({"error": "Uploaded file is empty"}), 400
        if not is_image_content(content, extension):
            return jsonify({"error": "Uploaded file is not a valid image"}), 400

        stored_name = f"{uuid.uuid4().hex}.{extension}"
        filepath = upload_root / stored_name
        filepath.write_bytes(content)

        image_id = max((int(item.get("id", 0)) for item in images), default=0) + 1
        image_entry = {
            "id": image_id,
            "original_filename": filename,
            "title": filename,
            "stored_filename": stored_name,
            "url": f"/static/uploads/{stored_name}",
            "file_type": uploaded_file.mimetype or f"image/{extension}",
            "size": os.path.getsize(filepath),
            "uploaded_at": datetime.now(timezone.utc).isoformat(),
        }
        images.append(image_entry)
        save_images()

        return jsonify(image_entry), 201

    @app.route("/images/search", methods=["GET"])
    def search_images():
        query = request.args.get("q", "")
        if query is None or not query.strip():
            return jsonify({"error": "Search term is required"}), 400

        query_lower = query.lower()
        matches = [
            image for image in images
            if query_lower in image.get("original_filename", image.get("title", "")).lower()
        ]
        return jsonify(matches)

    @app.route("/images/<image_id>", methods=["DELETE"])
    def delete_image(image_id):
        for idx, image in enumerate(images):
            if str(image.get("id")) == str(image_id):
                file_name = image.get("stored_filename")
                file_path = resolve_allowed_path(file_name)

                if file_path is None:
                    return jsonify({"error": "Image storage path is invalid"}), 500

                if file_path is not None and file_path.exists():
                    file_path.unlink()

                del images[idx]
                save_images()
                return jsonify({"message": "Image deleted"})

        return jsonify({"error": "Image not found"}), 404

    return app


app = create_app()


if __name__ == "__main__":
    app.run(debug=True, port=5000)
