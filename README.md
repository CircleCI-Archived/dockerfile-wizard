# CircleCI Dockerfile Wizard

Easily build Docker images with different versions/combinations of common languages/dependencies, for use on CircleCI.

## Prerequisites

- [CircleCI account](https://circleci.com/signup)
- [Docker Hub account](https://hub.docker.com) (Docker itself **does not** need to be installed on your computer)
- [Make](https://en.wikipedia.org/wiki/Make_(software)) & [Perl](https://perl.org) (included in most macOS & Linux installations)

## Usage

**1. Fork this repository and start building it on CircleCI:**

![Setup Project](https://raw.githubusercontent.com/CircleCI-Public/dockerfile-wizard/master/img/setup%20project.jpg "Setup Project")

**2. Add your Docker Hub username (`DOCKER_USERNAME`) and password (`DOCKER_PASSWORD`) to CircleCI, either as project-specific environment variables (shown below), or as resources in your **org-global** (default) [Context](https://circleci.com/docs/2.0/contexts)**

![Environment Variables](https://raw.githubusercontent.com/CircleCI-Public/dockerfile-wizard/master/img/env%20vars.jpg "Environment Variables")

**3.** Clone your fork of the project onto your computer

**4.** Enter the cloned `dockerfile-wizard` directory and run `make ready` to prepare the `config.yml` file for building Docker images on CircleCI

**5.** Run `make setup` in the cloned directory, or else manually add the versions/dependencies that you need to `.circleci/config.yml` as specified in the [`image_config` section](https://github.com/circleci/dockerfile-wizard/blob/231237de1f6aaa0d197998044867816e0f8e7454/.circleci/config.yml#L1)

**6.** Commit and push your changes

Once the build has finished, your image will be available at `http://hub.docker.com/r/DOCKER_USERNAME/IMAGE_NAME` and can be used in other projects building on CircleCI (or anywhere else!). The Dockerfile for your image will be stored as an artifact in this project's `build` job.

To use the Dockerfile Wizard again, run `make reset` in the cloned directory, then repeat steps **4-6**.

### How it works

1. The `setup` script adds your requested version information to the config.yml file as environment variables
1. The `generate.sh` script runs on CircleCI and generates a Dockerfile based on those environment variables
1. CircleCI builds your Docker image from the generated Dockerfile, deploys it using your Docker credentials, and then tests your image using [Bats](https://github.com/sstephenson/bats), which we install in every Docker image built via this repository

### Notes

- The portions of this repository that run on your local computer are intended for Linux/macOS operating systems; they may not work on Windows
- This repository has not been tested with every possible permutation of versions/dependencies, and you may encounter errors with some combinations of various languages/tools. If your `build` job fails, check its `docker build` step—there's likely a compilation error with a particular version of Ruby, Node, or Python.
- Thanks to [jmason](https://github.com/jmason/tap-to-junit-xml) for the `tap-to-junit` script!
- [Feedback/questions/bugs welcome!](https://github.com/CircleCI-Public/dockerfile-wizard/issues)
- Want to do all this yourself? Check out our video on [creating custom Docker images for CircleCI](https://youtube.com/watch?v=JYVLeguIbe0)

### To-do

- Add PHP support
- Add support for other container registries
