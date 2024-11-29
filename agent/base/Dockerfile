FROM python:slim-bookworm
#  Install all the requirements using pip
#  I deleted pip upgrade command in Dockerfile because it seems to cause some issues
RUN   pip install rfswarm-agent 
RUN   pip install robotframework-requests 
RUN   pip install robotframework-datadriver

# Create a user 'rfagent'
RUN useradd -m rfagent

# Switch to 'rfagent user'
USER rfagent

COPY --chown=rfagent  agent/base/entrypoint.sh  /usr/rfagent/scripts/
COPY --chown=rfagent  tests/*  /usr/rfagent/scripts/
COPY --chmod=765 agent/base/entrypoint.sh /usr/rfagent/scripts
WORKDIR  /usr/rfagent

# Run the agent
ENTRYPOINT ["/usr/rfagent/scripts/entrypoint.sh"]
       