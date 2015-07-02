#!/bin/bash

# Jenkins build steps
docker build -t i386-debian-mkimage .
docker run --privileged -v /var/run/docker.sock:/var/run/docker.sock i386-debian-mkimage
docker push resin/i386-debian
