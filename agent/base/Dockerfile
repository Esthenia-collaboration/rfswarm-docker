FROM python:slim-bookworm
#  Install all the requirements using pip
#  I deleted pip upgrade command in Dockerfile because it seems to cause some issues
RUN   pip install rfswarm-agent 
RUN   pip install robotframework-requests 
RUN   pip install robotframework-datadriver

COPY  agent/base/entrypoint.sh /opt/bin/entrypoint.sh
RUN   chmod +x /opt/bin/entrypoint.sh

# Run the agent
ENTRYPOINT ["/opt/bin/entrypoint.sh"]
