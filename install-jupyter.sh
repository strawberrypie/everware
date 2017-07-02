#!/bin/bash

apt-get install -y -q \
    curl \
    xvfb \
    wget \
    htop \
    vim \
    zlib1g-dev \
    git \
    libzmq3-dev \
    sqlite3 \
    libsqlite3-dev \
    pandoc \
    libcurl4-openssl-dev \
    nodejs \
    nodejs-legacy \
    npm

npm install -g configurable-http-proxy

conda env update -n root --file jupyter_req.yml

source activate py3_env
conda install -y ipykernel && python -m ipykernel install

source deactivate