FROM ubuntu:20.04
# This is the Focal Fossa ubuntu version
MAINTAINER Javier Arroyo <javier.arroyo@kuleuven.be>

# Avoid warnings while installing ubuntu
# debconf: unable to initialize frontend: Dialog
# debconf: (TERM is not set, so the dialog frontend is not usable.)
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install packages
RUN apt update && \
    apt install -y \
    git \
    wget  && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Install pyfmi using miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH
RUN conda install -c conda-forge pyfmi

RUN conda install -c conda-forge matplotlib
RUN conda install pandas requests
RUN conda install -c anaconda flask flask-restful flask_cors

ENV HOME /home/developer
WORKDIR $HOME

RUN mkdir models && \
    mkdir doc

ENV PYTHONPATH $PYTHONPATH:$HOME
ENV BOPTEST_DASHBOARD_SERVER https://api.boptest.net:8081/

CMD python restapi.py && bash

EXPOSE 5000


