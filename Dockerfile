FROM ubuntu:zesty
MAINTAINER Anton Kiselev <straw.berry.pie@ya.ru>

COPY *.yml install.sh ./
ENV PATH="/usr/miniconda3/bin:${PATH}"
RUN ./install.sh
