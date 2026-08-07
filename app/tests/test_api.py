from fastapi.testclient import TestClient

from app.src.main import app


client = TestClient(app)


def test_root():
    response = client.get("/")

    assert response.status_code == 200
    assert response.json()["status"] == "running"


def test_health_check():
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json()["status"] == "healthy"


def test_application_status():
    response = client.get("/api/v1/status")

    assert response.status_code == 200
    assert response.json()["status"] == "operational"