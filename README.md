# CircleCI Dockerfile Wizard

This tool can help you easily build Docker images with different versions/combinations of common languages/dependencies, for use on CircleCI.

## Prerequisites

- [CircleCI account](https://circleci.com/signup)
- [Docker Hub account](https://hub.docker.com) (Docker itself **does not** need to be installed on your computer, however)
- [Make](https://en.wikipedia.org/wiki/Make_(software)) & [Perl](https://perl.org) (included in most macOS & Linux installations)

## Usage

**1. Fork this repository and start building it on CircleCI:**

![Setup Project](https://raw.githubusercontent.com/CircleCI-Public/dockerfile-wizard/master/img/setup%20project.jpg "Setup Project")

**2. Add your Docker Hub username (`DOCKER_USERNAME`) and password (`DOCKER_PASSWORD`) to CircleCI, either as project-specific environment variables (shown below), or as resources in your **org-global** (default) [Context](https://circleci.com/docs/2.0/contexts)**

![Environment Variables](https://raw.githubusercontent.com/CircleCI-Public/dockerfile-wizard/master/img/env%20vars.jpg "Environment Variables")

**3.** Clone your fork of the project onto your computer

**4.** Enter the cloned `dockerfile-wizard` directory and run `make ready` to prepare the `config.yml` file for building Docker images on CircleCI

**5.** Run `./setup` in the cloned directory, or else manually add the versions/dependencies that you need to `.circleci/config.yml` as specified in the [`image_config` section](https://github.com/circleci/dockerfile-wizard/blob/231237de1f6aaa0d197998044867816e0f8e7454/.circleci/config.yml#L1)

**6.** Commit and push your changes

Once the build has finished, your image will be available at `http://hub.docker.com/r/DOCKER_USERNAME/IMAGE_NAME` and can be used in other projects building on CircleCI (or anywhere else!). The Dockerfile for your image will be stored as an artifact in this project's `build` job.

To use the Docker Wizard again, run `make reset` in the cloned directory, then repeat steps **4-6**.

### Notes

- This repository has not been tested with every possible combination of versions/dependencies; you may encounter errors with some legacy versions of various languages/tools
- [Feedback/questions/bugs welcome!](https://github.com/CircleCI-Public/dockerfile-wizard/issues)

### To-do

- Add PHP support
- Add support for other container registries
