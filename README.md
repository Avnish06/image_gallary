# Image Gallery

## Tools used
Flask>=3.0,<4.0
flask-cors>=4.0,<6.0
pytest>=8.0,<9.0 

## Fresher Assignment

Build a small Python image gallery application. The goal is to demonstrate your ability to design a clean Python project, handle files safely, expose useful functionality, and write maintainable code.

You may choose the Python framework or interface. A web API is recommended, but a command-line application is also acceptable if the same behavior is supported.

## Required Features

### 1. Upload an image

- Accept an image file from the user.
- Store the image using a unique filename or identifier.
- Preserve the original filename as metadata.
- Accept common image formats such as JPEG, PNG, and GIF.
- Reject unsupported file types and empty or invalid files with a useful error message.
- Prevent path traversal and unsafe filenames.

### 2. List images

- Return all uploaded images.
- Include, at minimum:
	- Image identifier
	- Original filename
	- File type or MIME type
	- File size
	- Upload date and time
- Use a consistent ordering, such as newest images first.
- Return an empty result when no images have been uploaded.

### 3. Delete an image

- Delete an image using its identifier.
- Remove both the stored file and its metadata.
- Return a clear result when the image does not exist.
- Do not allow a user-provided identifier to delete files outside the gallery storage directory.

### 4. Search images

- Search uploaded images by their original filename.
- Make the search case-insensitive.
- Support partial matches; for example, `holiday` should match `holiday-photo.jpg`.
- Return an empty result when there are no matches.
- Handle a missing or blank search term clearly.

## Suggested API Contract

If you build a web API, the following routes are recommended. You may use different route names if the README or API documentation explains them.

| Method | Route | Purpose |
| --- | --- | --- |
| `POST` | `/images` | Upload one image |
| `GET` | `/images` | List all images |
| `GET` | `/images/search?q=<term>` | Search by filename |
| `DELETE` | `/images/<id>` | Delete one image |

Use appropriate HTTP status codes and return JSON responses with a consistent structure. Include a short API usage example in your project documentation.

## Technical Expectations

- Use Python 3.10 or newer.
- Organize the code into sensible modules instead of putting all logic in one file.
- Keep storage configuration separate from business logic where practical.
- Store image metadata in a lightweight database or a clearly documented JSON/database solution.
- Do not commit uploaded images, virtual environments, secrets, or generated files.
- Add input validation and helpful error handling.
- Use clear names, small functions, and readable code.
- Add type hints where they improve clarity.
- Provide a `requirements.txt` or `pyproject.toml` file.

## Testing Requirements

Write automated tests for the important behavior, including:

- Successful image upload
- Rejection of an unsupported file
- Listing uploaded images
- Case-insensitive partial search
- Deleting an existing image
- Attempting to delete a missing image
- Empty gallery and no-search-result behavior
- Protection against unsafe filenames or paths

Tests should not depend on files or data already present on the developer's machine. Use temporary directories and test data where appropriate.

## Submission Requirements

The project should contain:

1. Application source code
2. Automated tests
3. Dependency file (`requirements.txt` or `pyproject.toml`)
4. Updated documentation with setup and run instructions
5. Example requests or CLI commands for all four features
6. A short note describing design decisions and any limitations

The application should be runnable from a fresh checkout with documented commands. Include the commands used to run the test suite.

## Evaluation Criteria

- **Correctness:** All four required features work as described.
- **Python fundamentals:** Appropriate use of functions, modules, exceptions, collections, and file handling.
- **Code quality:** Readable structure, naming, separation of concerns, and minimal duplication.
- **Safety:** Secure file handling, validation, and no path traversal vulnerability.
- **Testing:** Meaningful automated tests that cover success and failure cases.
- **Documentation:** A reviewer can install, run, and test the project without guessing.
- **Maintainability:** The solution can be extended with features such as pagination, tags, authentication, or image resizing.

## Optional Enhancements

These are not required, but may be discussed or implemented after the core features are complete:

- Pagination for the list endpoint
- Search by file type or upload date
- Image thumbnails or resizing
- Maximum file-size configuration
- Duplicate-file detection
- Docker support
- Authentication and authorization
- OpenAPI or Swagger documentation

Focus on a correct, tested, and documented solution before attempting optional enhancements.

