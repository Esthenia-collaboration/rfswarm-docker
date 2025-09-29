FROM  ghcr.io/esthenia-collaboration/rfswarm-base-image:latest
#  Install all the requirements using pip
ARG PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1
USER root
RUN   pip install --upgrade pip
RUN   pip install robotframework-sshlibrary
# Switch to user agent
USER rfagent
