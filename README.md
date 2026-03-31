# ACEest DevOps Assignment

This repository preserves the original versioned ACEest fitness scripts and adds a minimal Flask API plus CI/CD files for the DevOps assignment.

## What Was Preserved

- Existing versioned Python files such as `Aceestver-3.2.4.py` were left in place.
- The original fitness and gym theme was kept.
- No bulk rewrite of the legacy desktop code was performed.

## What Was Added

- `app.py` for a simple Flask API
- `tests/test_app.py` for pytest coverage
- `requirements.txt`
- `Dockerfile`
- `.github/workflows/main.yml`
- `Jenkinsfile`
- `.flake8`, `.gitignore`, `.dockerignore`, and `pytest.ini`

## API Endpoints

- `GET /` returns a health check response
- `GET /workouts` returns sample workout data

## Local Run

```bash
python -m venv .venv
```

Windows PowerShell:

```powershell
.venv\Scripts\Activate.ps1
```

Install dependencies:

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

Run the application:

```bash
python app.py
```

Run tests:

```bash
python -m pytest
```

Run lint:

```bash
python -m flake8 app.py tests
```

## Docker

Build image:

```bash
docker build -t aceest-fitness-app .
```

Run container:

```bash
docker run -p 5000:5000 aceest-fitness-app
```

## GitHub Actions

The GitHub Actions workflow:

1. Installs Python dependencies
2. Runs `flake8` on the new Flask files
3. Runs `pytest`
4. Builds the Docker image

## Jenkins

The Jenkins pipeline validates the same steps:

1. Checkout
2. Dependency installation
3. Lint
4. Test
5. Docker build

## Notes

- The CI/CD pipeline is intentionally scoped to the new Flask deliverables so the archived version files do not need to be rewritten.
- This keeps your original work intact while making the assignment submission CI/CD-ready.
