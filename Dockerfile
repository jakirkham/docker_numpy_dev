FROM ubuntu:xenial
MAINTAINER John Kirkham <jakirkham@gmail.com>


RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get -y upgrade && \
    apt-get install -y libreadline-dev\
                       gcc \
                       gfortran \
                       python3.4-dev \
                       python3.4-dbg \
                       libatlas-base-dev \
                       liblapacke-dev \
                       curl \
                       git \
                       vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3.4 /usr/bin/python && \
    ln -s /usr/bin/python3.4-dbg /usr/bin/python3-dbg && \
    ln -s /usr/bin/python3.4-dbg /usr/bin/python-dbg

RUN curl https://bootstrap.pypa.io/get-pip.py > get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip install --no-cache-dir nose \
                               ipython \
                               cython

RUN git clone https://github.com/numpy/numpy && \
    cd /numpy && \
    python setup.py build && \
    python setup.py install && \
    python setup.py clean --all

WORKDIR /home
