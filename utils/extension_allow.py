ALLOWED_EXTENSIONS = {"png", "jpg", "jpeg"}



def allowed_file(filename):
    return ("." in filename and filename.rsplit(".", 1)[1].lower() in ALLOWED_EXTENSIONS
    )



    if not extension_allow(filename):
        return jsonify({"error": "File type not allowed"
        )},