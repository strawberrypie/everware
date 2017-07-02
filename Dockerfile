FROM ubuntu:xenial

MAINTAINER Anton Kiselev <straw.berry.pie@ya.ru>

COPY *.yml install.sh ./
RUN chmod +x ./install.sh
ENV PATH="/usr/miniconda3/bin:${PATH}"
RUN ./install.sh

RUN mkdir -p /srv
COPY install-jupyter.sh run-jupyter.sh /srv/
RUN chmod +x /srv/install-jupyter.sh /srv/run-jupyter.sh
COPY jupyter_req.yml ./
ADD https://raw.githubusercontent.com/jupyterhub/jupyterhub/master/scripts/jupyterhub-singleuser /usr/local/bin/jupyterhub-singleuser
RUN chmod +x /usr/local/bin/jupyterhub-singleuser

EXPOSE 8888

ENV SHELL /bin/bash
CMD ["sh", "/srv/run-jupyter.sh"]
