# CircleCI Dockerfile Wizard

This tool can help you easily build Docker images with different versions of common languages/dependencies, for use on CircleCI.

## Prerequisites

- CircleCI account
- Docker Hub account
- Some version of `make`

## Usage

1. Fork this repository and start building it on CircleCI
1. Add your Docker Hub username (`DOCKER_USERNAME`) and password (`DOCKER_PASSWORD`) to your CircleCI account, either as project-specific environment variables, or as resources in your **org-global** (default) [Context](https://circleci.com/docs/2.0/contexts)
1. Clone your fork of the project down to your local machine
1. Enter the cloned directory and run `make ready` to prepare the `config.yml` file for building Docker images on CircleCI
1. Run `./setup` in the cloned directory
1. Commit and push your changes

Once the build has finished, your image will be available at `http://hub.docker.com/r/DOCKER_USERNAME/IMAGE_NAME` and can be used in other projects building on CircleCI.

To use the Docker Wizard again, run `make reset`in the cloned directory, then repeat steps 4-6.

### To-do

- Add PHP support
- Add support for other container registries