#!/bin/bash

echo "FROM nvcr.io/nvidia/tensorflow:18.08-py3"

#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#
# Prepare Container Environment #
#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#
echo "RUN apt-get update"
echo "RUN apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        bzip2 \
        cmake \
        curl \
        git \
        libopenblas-dev \
        unzip \
        vim \
        wget"
echo "RUN rm -rf /var/lib/apt/lists/"
