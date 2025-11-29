# syntax=docker/dockerfile:1

FROM python:3.13.9-slim

ARG PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1

# Default values.
ENV MANAGER=http://manager:8138 \
    LOG_LEVEL=2 \
    PROPERTY=container:docker

# Install all the requirements using pip, add pip upgrade
RUN pip install --upgrade pip \
    && pip install rfswarm-agent \
        robotframework-requests \
        robotframework-datadriver \
        robotframework-faker

# Create a user 'rfagent'
RUN useradd -m rfagent

# Switch to 'rfagent user'
USER rfagent

# Copy the Python command builder script
COPY --chown=rfagent --chmod=765 agent/base/build-python-cmd.sh /usr/local/bin/build-python-cmd.sh
COPY --chown=rfagent --chmod=765 agent/base/entrypoint.sh /usr/local/bin/base-entrypoint.sh

WORKDIR /usr/rfagent

# Run the agent
ENTRYPOINT ["base-entrypoint.sh"]
