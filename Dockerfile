FROM continuumio/miniconda:latest
MAINTAINER John Kirkham <jakirkham@gmail.com>


RUN conda update --all -y && \
    conda clean -tipsy

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get -y upgrade && \
    apt-get install -y gcc && \
    apt-get install -y gfortran && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN conda install -y cython && \
    conda install -y ipython && \
    conda install -y -c nanshe openblas && \
    conda clean -tipsy

RUN git clone https://github.com/jakirkham/numpy -b opt_dot_trans && \
    cd /numpy && \
    python setup.py build && \
    python setup.py install && \
    python setup.py clean --all

WORKDIR /home
