FROM python:slim-bookworm
#  Install all the requirements using pip
RUN   pip install --upgrade pip 
RUN   pip install rfswarm-agent 
RUN   pip install robotframework-requests 
RUN   pip install robotframework-datadriver

COPY  agent/base/entrypoint.sh /opt/bin/entrypoint.sh
RUN   chmod +x /opt/bin/entrypoint.sh

# Run the agent
ENTRYPOINT ["/opt/bin/entrypoint.sh"]
