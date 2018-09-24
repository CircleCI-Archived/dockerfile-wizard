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
        wget \
	libxml-generator-perl

RUN rm -rf /var/lib/apt/lists/

##+#+#+#+#+#+#+#+#
# Infrastructure #
##+#+#+#+#+#+#+#+#

#####################
# Install Dockerize #
#####################
RUN DOCKERIZE_URL="https://circle-downloads.s3.amazonaws.com/circleci-images/cache/linux-amd64/dockerize-latest.tar.gz" \
  && curl --silent --show-error --location --fail --retry 3 --output /tmp/dockerize-linux-amd64.tar.gz $DOCKERIZE_URL \
  && tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64.tar.gz \
  && rm -rf /tmp/dockerize-linux-amd64.tar.gz \
  && dockerize --version

#############################
# Install BATS for testing  #
#############################
RUN git clone https://github.com/bats-core/bats-core &&\
		cd bats-core &&\
		./install.sh /usr/local


#########################################
# Update pip & Install Python Packages #
########################################
RUN pip install --upgrade pip && \
    pip install \
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

