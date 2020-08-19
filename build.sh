#!/usr/bin/env bash

docker build -t chargetrip-docker-aws-maven:latest .
docker tag chargetrip-docker-aws-maven:latest chargetripio/chargetrip-docker-aws-maven:latest
docker push chargetripio/chargetrip-docker-aws-maven:latest
