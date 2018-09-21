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
        ca-certificates \
        bzip2 \
        cmake \
        curl \
        git \
        gzip \
        libopenblas-dev \
        ssh \
        tar \
        unzip \
        vim \
        wget

RUN rm -rf /var/lib/apt/lists/

##############
# Update PIP #
##############
RUN pip install --upgrade pip

###########################
# Install Python Packages #
###########################
RUN pip install \
    numpy \
    scipy \
    pandas \
    pipenv \
    pipenv-tools \
    virtualenv \
    scikit-learn \
    jupyter \
    jupyterlab \
    theano \
    keras \
    imutils \
    pillow \
    lxml

#+#+#+#+#+#+#+#+#+#+#+#
# Prepare Environment #
#+#+#+#+#+#+#+#+#+#+#+#

RUN mkdir /root/.jupyter && chmod a+rwx /root/.jupyter
COPY ./container-files/jupyter_notebook_config.py /root/.jupyter/

RUN mkdir /media/notebooks && chmod a+rwx /media/notebooks
RUN mkdir /.local && chmod a+rwx /.local
WORKDIR /media/notebooks
EXPOSE 8888

