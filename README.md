# DevOps Azure Pipeline Demo (FastAPI)

Small FastAPI service to showcase CI/CD with **Azure DevOps** and **GitHub Actions**, plus Docker build.

## Run locally
```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
# open http://127.0.0.1:8000/ and /health
```

## Docker
```bash
docker build -t azure-pipeline-demo:local .
docker run --rm -p 8000:8000 azure-pipeline-demo:local
```

## GitHub Actions
- Workflow at `.github/workflows/ci.yml` installs deps, runs tests, and builds the image.

## Azure DevOps Pipeline
- `azure-pipelines.yml` builds/tests, with optional Docker build and ACR push (commented).  
- To enable ACR push: set `ACR_LOGIN_SERVER`, `ACR_USERNAME`, `ACR_PASSWORD` as secret variables.

## (Optional) Nexus artifact upload
If you have a Nexus hosted repo, you can publish build artifacts with:
```bash
export NEXUS_URL="https://your-nexus.example.com"
export NEXUS_REPO="raw-releases"
export NEXUS_USER="username"
export NEXUS_PASS="*****"
tar czf artifact-${BUILD_ID:-local}.tgz app/*
curl -u "$NEXUS_USER:$NEXUS_PASS"   --upload-file artifact-${BUILD_ID:-local}.tgz   "$NEXUS_URL/repository/$NEXUS_REPO/devops-azure-pipeline-demo/artifact-${BUILD_ID:-local}.tgz"
```
