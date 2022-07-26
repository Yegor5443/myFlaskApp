FROM ubuntu:20.04
RUN mkdir /app && mkdir /opt/venv-app
ENV VIRTUAL_ENV /opt/venv-app
ENV PATH $VIRTUAL_ENV/bin:$PATH
WORKDIR /app
RUN set -ex && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends wget \
       python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools python3-venv nginx supervisor \
    && chown www-data:www-data -R /app \
    && python3 -m venv /opt/venv-app \
    && pip3 install -U pip setuptools wheel \
    && chown www-data:www-data -R /opt/venv-app

EXPOSE 80
CMD ["echo", "'done'"]
