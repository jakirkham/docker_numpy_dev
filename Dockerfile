FROM continuumio/miniconda:latest
MAINTAINER John Kirkham <jakirkham@gmail.com>


RUN conda update --all -y && \
    conda clean -tipsy
