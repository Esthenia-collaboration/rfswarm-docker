FROM  ghcr.io/esthenia-collaboration/rfswarm-agent-base:latest
#  Install all the requirements using pip
USER root
RUN   pip install --upgrade pip
RUN   pip install robotframework-sshlibrary
# Switch to user agent
USER rfagent

#==============================================================
# Run entrypoint_firefox.sh to set virtual display
#==============================================================
COPY --chown=rfagent --chmod=765  agent/sshlibrary  /usr/rfagent
WORKDIR  /usr/rfagent
ENTRYPOINT [ "/usr/rfagent/entrypoint.sh" ]