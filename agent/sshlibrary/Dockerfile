FROM  ghcr.io/esthenia-collaboration/rfswarm-agent-base:latest
#  Install all the requirements using pip
USER root
RUN   pip install --upgrade pip
RUN   pip install robotframework-sshlibrary
# Switch to user agent
USER rfagent
