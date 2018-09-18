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


##+#+#+#+#+#+#+#+#
# Infrastructure #
##+#+#+#+#+#+#+#+#

###############################
# Install & Update Anaconda 3 #
###############################
RUN curl -o /tmp/install.sh https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
RUN bash /tmp/install.sh -b -p /opt/anaconda3
RUN rm -rf /tmp/install.sh
RUN /opt/anaconda3/bin/conda upgrade conda -y
RUN /opt/anaconda3/bin/conda upgrade --all -y
RUN source ~/.bashrc

##############
# Update PIP #
##############
RUN /opt/anaconda3/bin/pip install --upgrade pip

###########################
# Install Python Packages #
###########################
RUN /opt/anaconda3/bin/pip install \
    tensorflow-gpu==1.10.1 \
    keras \
    imutils \
    pillow \
    lxml
	
#+#+#+#+#+#+#+#+#+#+#+#
# Prepare Environment #
#+#+#+#+#+#+#+#+#+#+#+#
#COPY ./bash_profile /root/.bash_profile
#COPY ./jupyter_notebook_config.py /root/
#RUN ls -alh /root/
#RUN sh /root/.bash_profile
#RUN mkdir /media/notebooks
#RUN mkdir /notebooks && chmod a+rwx /notebooks
#RUN mkdir /.local && chmod a+rwx /.local
#WORKDIR /notebooks
#EXPOSE 8888
#
# CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/notebooks --ip 0.0.0.0 #--no-browser --allow-root"]
#
