#!/bin/bash

REGION="ap-south-1"
ACCOUNT_ID="365712037872"
REPO_NAME="githubactionsproj"

IMAGE_URI="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest"

echo "Pulling image: $IMAGE_URI"

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

docker pull $IMAGE_URI

docker stop my-app || true
docker rm my-app || true

docker run -d -p 80:3000 --name my-app $IMAGE_URI
