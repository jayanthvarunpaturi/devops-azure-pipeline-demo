#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${IMAGE_NAME:-azure-pipeline-demo:local}"
docker build -t "$IMAGE_NAME" .
docker run --rm -p 8000:8000 "$IMAGE_NAME"
