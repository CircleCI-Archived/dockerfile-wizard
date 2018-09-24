# CircleCI Dockerfile Wizard

Easily build Docker images with different versions/combinations of common languages/dependencies, for use on CircleCI.

## Prerequisites

- [CircleCI account](https://circleci.com/signup)
- [Docker Hub account] https://hub.docker.com/r/midscapstone/docker_images/
- [Git account] https://github.com/MIDS-Capstone/dockerfile-wizard

## Setup

**1. In CircleCI, login and then go to Settings >> MIDS-Capstone >> Organization >> Contexts 

Create a DOCKER_HUB context and set the security to PUBLIC

[Context](https://circleci.com/docs/2.0/contexts)
[MIDS-Capstone Context](https://circleci.com/gh/organizations/MIDS-Capstone/settings#contexts)

**2. Add the following environment variables

- Docker Hub username (`DOCKER_USERNAME`) 
- Docker Hub password (`DOCKER_PASSWORD`) 
- NVidia Docker Hub OAuth key (`NVIDIA_DOCKER_OAUTH_KEY`)

The NVidia key is used to access their private Docker Repo so we can download their source image nvcr.io/nvidia/tensorflow:18.08-py3

![Environment Variables](https://raw.githubusercontent.com/CircleCI-Public/dockerfile-wizard/master/img/env%20vars.jpg "Environment Variables")

**3.** Download this git repo https://github.com/MIDS-Capstone/dockerfile-wizard

**4.** Create a branch for your build fb-INITIALS-some-info

**5.** Amend the build as necessary preparing the `config.yml` file and any shell scripts you need for building Docker images on CircleCI

**6.** Commit and push your changes

Once the build has finished, your image will be available at `http://hub.docker.com/r/DOCKER_USERNAME/IMAGE_NAME` and can be used in other projects building on CircleCI (or anywhere else!). The Dockerfile for your image will be stored as an artifact in this project's `build` job.

### How it works

1. CircleCI builds your Docker image from the generated Dockerfile, deploys it using your Docker credentials, and then tests your image using [Bats](https://github.com/sstephenson/bats), which we install in every Docker image built via this repository

### Notes

- [Feedback/questions/bugs welcome!](https://github.com/CircleCI-Public/dockerfile-wizard/issues)
- Want to do all this yourself? Check out our video on [creating custom Docker images for CircleCI](https://youtube.com/watch?v=JYVLeguIbe0)

### To-do

- Add the raw NVIDIA image to our docker hub repo ( and make it optional to fetch from the source NVIDIA repo ) 
- Change the way the docker images are layered ( and maybe have a base image ) onto which we layer everything else
- Remove Anaconda ( replacing with pip install and pip env)
- Collapse some of the RUN cmds into larger blocks to minimize layering in docker image
