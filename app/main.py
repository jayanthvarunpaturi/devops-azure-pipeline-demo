from fastapi import FastAPI

app = FastAPI(title="DevOps Azure Pipeline Demo")

@app.get("/")
def read_root():
    return {"message": "DevOps Azure Pipeline Demo up!"}

@app.get("/health")
def health():
    return {"status": "ok"}
