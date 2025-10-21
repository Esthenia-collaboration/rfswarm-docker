FROM    python:3.13.9-slim

ENV     PYTHONPATH="${PYTHONPATH}:/src/"

RUN     apt-get -y update && apt-get install -y xvfb tk-dev
RUN     pip install --upgrade pip && pip install --no-cache-dir --user tk configparser psutil rfswarm-manager

#Install ssh server and sudo command line
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir -p /var/run/sshd
# create non-root user
RUN useradd -m -s /bin/bash manageruser && \
    echo 'manageruser:managerpwd' | chpasswd && \
    usermod -aG sudo manageruser   
#secured ssh
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    echo 'AllowUsers manageruser' >> /etc/ssh/sshd_config

COPY  manager/entrypoint.sh /opt/bin/entrypoint.sh
COPY  manager/manager.ini /src/manager/manager.ini
RUN   chmod +x /opt/bin/entrypoint.sh

EXPOSE  22

ENTRYPOINT ["/opt/bin/entrypoint.sh"]