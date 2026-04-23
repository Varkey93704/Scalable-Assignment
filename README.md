
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

GitHub Actions runs automatically whenever code is pushed to the repository. It installs dependencies, runs lint checks, executes tests, and builds the Docker image.

<img width="2774" height="1406" alt="image" src="https://github.com/user-attachments/assets/fffa7d70-eb16-4949-9b42-5fae51f9fbc3" />

Jenkins is also connected to the same repository. It pulls the latest code and runs a similar pipeline in a separate environment. This acts as an additional validation step to make sure the build works outside the GitHub environment as well.

<img width="2790" height="1400" alt="image" src="https://github.com/user-attachments/assets/0d85c59f-6cab-425b-8f98-ac7c464c568f" />


---

## Kubernetes Rolling Update

This project also supports a simple rolling update simulation in Minikube.

Apply the Kubernetes files:

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

To roll from one image version to another, first make sure the new image exists locally and is tagged correctly, then run:

```powershell
.\rolling-update.ps1 -Version v1.2
```

This script:

* loads the tagged image into Minikube
* updates the deployment image
* waits for rollout completion
* shows the current pods

You can verify the app after rollout at:

```text
http://192.168.49.2:30080
```

---

## Notes

There were a few issues while setting this up (especially Jenkins and Docker), but fixing them helped me understand how CI/CD works in real scenarios.

---

## Author

Varkey Rosh

