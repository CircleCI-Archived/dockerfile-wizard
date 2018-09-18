##################################################
# W210 Capstone project base docker docker image #
##################################################
FROM nvcr.io/nvidia/tensorflow:18.08-py3
LABEL maintainer "Josh Lee <joshlee@ischool.berkeley.edu>"
#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#
# Prepare Container Environment #
#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        bzip2 \
        cmake \
        curl \
        git \
        libopenblas-dev \
        unzip \
        vim \
        wget
RUN rm -rf /var/lib/apt/lists/