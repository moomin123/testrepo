#!/usr/bin/env bash

gcloud -q auth configure-docker
TAG=${PULL_BASE_REF:1}

docker build -t gcr.io/kf-feast/test:$TAG -t gcr.io/kf-feast/test:latest .
docker push gcr.io/kf-feast/test:$TAG
docker push gcr.io/kf-feast/test:latest
