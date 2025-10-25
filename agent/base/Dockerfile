FROM  python:3.13.9-slim

ENV PYTHONPATH="${PYTHONPATH}:/src/:/usr/rfagent/"
ARG PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1

#  Install all the requirements using pip, add pip upgrade
RUN   pip install --upgrade pip
RUN   pip install rfswarm-agent 
RUN   pip install robotframework-requests 
RUN   pip install robotframework-datadriver

# Create a user 'rfagent'
RUN useradd -m rfagent

# Switch to 'rfagent user'
USER rfagent

COPY --chown=rfagent --chmod=765 agent/base/entrypoint.sh /usr/rfagent/entrypoint.sh

WORKDIR  /usr/rfagent

# Run the agent
ENTRYPOINT ["/usr/rfagent/entrypoint.sh"]
