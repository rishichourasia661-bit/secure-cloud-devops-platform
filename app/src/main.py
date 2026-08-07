from fastapi import FastAPI

app = FastAPI(
    title="Secure Cloud DevOps Platform",
    version="1.0.0",
)


@app.get("/")
def root():
    return {
        "application": "Secure Cloud DevOps Platform",
        "status": "running",
    }


@app.get("/health")
def health_check():
    return {
        "status": "healthy",
    }


@app.get("/api/v1/status")
def application_status():
    return {
        "application": "secure-cloud-devops-platform",
        "version": "1.0.0",
        "status": "operational",
    }