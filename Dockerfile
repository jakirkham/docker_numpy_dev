FROM continuumio/miniconda:latest
MAINTAINER John Kirkham <jakirkham@gmail.com>


RUN conda update --all -y && \
    conda clean -tipsy

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get -y upgrade && \
    apt-get install -y gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN conda install -y cython && \
    conda install -y ipython && \
    conda install -y -c nanshe openblas && \
    conda update -y -c nanshe --all && \
    conda clean -tipsy
