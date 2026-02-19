#!/bin/bash

IMAGE_URI=$1

docker pull $IMAGE_URI

docker stop my-app || true
docker rm my-app || true

docker run -d -p 80:3000 --name my-app $IMAGE_URI
