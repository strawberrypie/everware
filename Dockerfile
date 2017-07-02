FROM ubuntu:17.04

MAINTAINER Anton Kiselev <straw.berry.pie@ya.ru>

COPY *.yml install.sh ./
ENV PATH="/usr/miniconda3/bin:${PATH}"
RUN ./install.sh

RUN mkdir -p /srv
COPY install-jupyter.sh run-jupyter.sh /srv/
COPY jupyter_req.yml ./
ADD https://raw.githubusercontent.com/jupyterhub/jupyterhub/master/scripts/jupyterhub-singleuser /usr/local/bin/jupyterhub-singleuser
RUN chmod 755 /usr/local/bin/jupyterhub-singleuser && /srv/install-jupyter.sh

EXPOSE 8888

ENV SHELL /bin/bash
CMD ["sh", "/srv/run-jupyter.sh"]