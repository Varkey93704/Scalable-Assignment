# 🏋️ ACEest Fitness & Gym – DevOps CI/CD Project

## About this project

This project is a simple fitness API built using Flask, but the main focus is not just the application — it’s the whole DevOps workflow around it.

The idea was to take a basic app and move it through a proper development lifecycle:

* version control with GitHub
* testing using Pytest
* containerization with Docker
* CI pipeline with GitHub Actions
* and finally a Jenkins build setup

So this is more like a **complete DevOps pipeline demo** rather than just a Flask project.

---

## What the app does

It’s a small API with a couple of endpoints:

* `/` → basic health check
* `/workouts` → returns a list of workouts

Nothing too complex here — the goal was to keep the app simple and focus on automation and deployment workflow.

---

## Tech used

* Python (Flask)
* Pytest
* Docker
* GitHub Actions
* Jenkins

---

## Running the project locally

First create a virtual environment and install dependencies:

```bash
python -m venv .venv
.venv\Scripts\activate   # Windows
pip install -r requirements.txt
```

Run the app:

```bash
python app.py
```

Then open:

```
http://localhost:5000
```

---

## Running tests

```bash
pytest
```

---

## Docker setup

Build the image:

```bash
docker build -t fitness-app .
```

Run the container:

```bash
docker run -p 5000:5000 fitness-app
```

---

## CI/CD pipeline

### GitHub Actions

Every time code is pushed:

* dependencies are installed
* lint checks are run
* tests are executed
* Docker image is built

This acts as the main CI pipeline.

---

### Jenkins

Jenkins is used as an additional build step.

It pulls the latest code from GitHub and:

* sets up a virtual environment
* installs dependencies
* runs lint checks
* runs tests

This basically works as a second validation layer to ensure everything builds correctly in a clean environment.

---

## Project structure

```
.
├── app.py
├── requirements.txt
├── Dockerfile
├── Jenkinsfile
├── tests/
├── .github/workflows/
```

---
<img width="2774" height="1406" alt="image" src="https://github.com/user-attachments/assets/fffa7d70-eb16-4949-9b42-5fae51f9fbc3" />
<img width="2790" height="1400" alt="image" src="https://github.com/user-attachments/assets/0d85c59f-6cab-425b-8f98-ac7c464c568f" />

## Final thoughts

This project was more about understanding how different tools fit together rather than building a complex application.

There were a few issues along the way (especially with Docker, GitHub Actions, and Jenkins setup), but fixing those helped in understanding how CI/CD actually works in practice.

Overall, this gave a good hands-on idea of:

* how pipelines are structured
* how automation works
* and how different environments behave differently

---

## Author

Varkey Rosh


