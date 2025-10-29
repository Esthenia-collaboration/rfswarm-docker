# syntax=docker/dockerfile:1

FROM python:3.13.7-slim

ENV PYTHONPATH="${PYTHONPATH}:/src/"

RUN apt-get -y update \
    && apt-get install -y xvfb tk-dev
RUN pip install --upgrade pip \
    && pip install --no-cache-dir --user tk configparser psutil rfswarm-manager

COPY manager/entrypoint.sh /opt/bin/entrypoint.sh
COPY manager/configuration/manager.ini /src/manager/configuration/manager.ini
RUN chmod +x /opt/bin/entrypoint.sh

WORKDIR /root/.local/lib/python3.13/site-packages/rfswarm_manager/

CMD ["sh", "-c", "/opt/bin/entrypoint.sh"]
