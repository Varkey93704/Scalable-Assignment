import sys
import os

sys.path.append(os.path.dirname(os.path.dirname(__file__)))
from flask import Flask, jsonify


WORKOUTS = [
    {
        "id": 1,
        "name": "Full Body HIIT",
        "category": "Fat Loss",
        "duration_minutes": 35,
    },
    {
        "id": 2,
        "name": "Push Pull Legs",
        "category": "Muscle Gain",
        "duration_minutes": 50,
    },
    {
        "id": 3,
        "name": "Light Strength Mobility",
        "category": "Beginner",
        "duration_minutes": 25,
    },
]


def create_app() -> Flask:
    app = Flask(__name__)

    @app.get("/")
    def health_check():
        return jsonify(
            {
                "status": "ok",
                "service": "aceest-fitness-api",
                "message": "ACEest fitness service is running.",
            }
        )

    @app.get("/workouts")
    def get_workouts():
        return jsonify({"count": len(WORKOUTS), "items": WORKOUTS})

    return app


app = create_app()


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
