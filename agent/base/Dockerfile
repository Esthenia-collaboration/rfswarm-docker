FROM python:3.13.7-slim

ENV PYTHONPATH="${PYTHONPATH}:/src/:/usr/rfagent/"
ARG PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1

#  Install all the requirements using pip
#  I deleted pip upgrade command in Dockerfile because it seems to cause some issues
RUN   pip install --upgrade pip
RUN   pip install rfswarm-agent 
RUN   pip install robotframework-requests 
RUN   pip install robotframework-datadriver

# Create a user 'rfagent'
RUN useradd -m rfagent

# Switch to 'rfagent user'
USER rfagent

COPY --chown=rfagent  agent/base /usr/rfagent
COPY --chmod=765 agent/base/entrypoint.sh /usr/rfagent/entrypoint.sh

WORKDIR  /usr/rfagent

# Run the agent
ENTRYPOINT ["/usr/rfagent/entrypoint.sh"]
