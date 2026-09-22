import os


def delete_image(image_id, images, upload_folder):

    entry = images.pop(str(image_id), None)

    if entry is None:
        return False

    extension = entry["filename"].rsplit(".", 1)[1].lower()
    filepath = os.path.join(upload_folder, f"{image_id}.{extension}")

    if os.path.exists(filepath):
        os.remove(filepath)

    return True
