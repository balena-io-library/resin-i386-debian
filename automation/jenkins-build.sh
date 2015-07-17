#!/bin/bash

# Jenkins build steps
docker build -t i386-debian-mkimage .
docker run --privileged -e REGION_NAME=$REGION_NAME -e ACCESS_KEY=$ACCESS_KEY -e SECRET_KEY=$SECRET_KEY -e BUCKET_NAME=$BUCKET_NAME -v /var/run/docker.sock:/var/run/docker.sock i386-debian-mkimage
docker push resin/i386-debian
