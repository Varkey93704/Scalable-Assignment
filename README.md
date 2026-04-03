
# ACEest Fitness & Gym – DevOps Project

## About

This is a simple Flask-based API project. The main idea wasn’t to build a big application, but to understand how a DevOps pipeline works from start to end.

I was given some base code earlier, and I used that as a reference to create a cleaner Flask API so it can be tested and integrated with CI/CD tools.

---

## What it does

The app is very basic:

* `/` → checks if the app is running
* `/workouts` → returns some sample workout data

Nothing too complex, just enough to test the pipeline.

---

## Tech used

* Python (Flask)
* Pytest
* Docker
* GitHub Actions
* Jenkins

---

## How to run

```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

Then open:

```
http://localhost:5000
```

---

## Run tests

```bash
pytest
```

---

## Docker

```bash
docker build -t fitness-app .
docker run -p 5000:5000 fitness-app
```

---

## CI/CD

GitHub Actions runs automatically on every push and checks:

* lint
* tests
* docker build
<img width="2774" height="1406" alt="image" src="https://github.com/user-attachments/assets/fffa7d70-eb16-4949-9b42-5fae51f9fbc3" />


Jenkins is also connected to the repo and runs a similar pipeline as a second check.
<img width="2790" height="1400" alt="image" src="https://github.com/user-attachments/assets/0d85c59f-6cab-425b-8f98-ac7c464c568f" />


---

## Notes

There were a few issues while setting this up (especially Jenkins and Docker), but fixing them helped me understand how CI/CD works in real scenarios.

---

## Author

Varkey Rosh

