from fastapi import FastAPI,Request
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_health():
    response = client.get("/users/health-check")
    assert response.status_code == 200
    assert response.json() ==  {"Message":'healthy user endpoint'}