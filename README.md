tool for customers to easily build Docker images on CircleCI !

working fairly well : https://circleci.com/gh/iynere/dockerfile-wizard/17

(it's expected that this repo will be failing on CircleCI as-is)

## internal-only instructions for other CSE's / SE's (for now):

- fork the repo
- set the env vars you need in the config.yml as specified
- assumes you have your docker login/password set as either build-specific env vars, or in your org-global context
- probably configurable for other container registries, as well, without too much modification
- please open an issue if you find some combination of versions / dependencies is causing builds to fail
