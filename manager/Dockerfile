FROM    python:3.11.4-slim-buster

ENV     PYTHONPATH="${PYTHONPATH}:/src/"

RUN     apt-get -y update && apt-get install -y xvfb tk-dev
RUN     pip install --upgrade pip && pip install --no-cache-dir --user tk configparser psutil rfswarm-manager

COPY  manager/entrypoint.sh /opt/bin/entrypoint.sh
RUN   chmod +x /opt/bin/entrypoint.sh

ENTRYPOINT ["/opt/bin/entrypoint.sh"]