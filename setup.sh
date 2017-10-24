#!/bin/sh

echo "CircleCI Docker Wizard"

echo "Name your image:"

read IMAGE_NAME

perl -i -pe 's/# name your image/$IMAGE_NAME/' .circleci/config.yml

echo "image name: $IMAGE_NAME"