#!/bin/bash
locale-gen en_US.UTF-8 && update-locale && apt-get update -y && apt-get install -y bzip2 make build-essential curl libhdf5-dev

curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh >conda_install.sh && chmod +x conda_install.sh && ./conda_install.sh -b -p /usr/miniconda3 && rm conda_install.sh

conda install -y numpy

conda env create --name py3_env --file conda_py3_env.yml

chmod -R 0755 /usr/miniconda3 || true