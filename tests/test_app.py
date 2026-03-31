import sys
import os

# Add project root to path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from app import create_app


def test_home():
    app = create_app()
    client = app.test_client()
    response = client.get("/")
    assert response.status_code == 200


def test_workouts():
    app = create_app()
    client = app.test_client()
    response = client.get("/workouts")
    assert response.status_code == 200