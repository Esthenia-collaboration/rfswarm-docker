# Utiliser une image compatible ARM64
FROM  python:3.11-slim

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

# expose ssh port
EXPOSE 22

# run ssh server
CMD ["/usr/sbin/sshd", "-D"]
