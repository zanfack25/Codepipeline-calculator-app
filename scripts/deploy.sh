#!/bin/bash

APP_DIR="/home/ec2-user/nodejs-app"
IMAGE_URI="123456789012.dkr.ecr.ca-central-1.amazonaws.com/nodejs-app:latest"
CONTAINER_NAME="nodejs-app"

cd $APP_DIR

# Stop and remove existing container
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Pull latest image
aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 123456789012.dkr.ecr.ca-central-1.amazonaws.com
docker pull $IMAGE_URI

# Run the container
docker run -d -p 80:3000 --name $CONTAINER_NAME $IMAGE_URI

