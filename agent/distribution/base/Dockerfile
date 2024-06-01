FROM python:slim-bookworm
#  Install all the requirements using pip
RUN   pip install --upgrade pip && pip install rfswarm-agent && pip install robotframework-requests \
      pip install robotframework-datadriver
# Run the agent
ENTRYPOINT ["rfswarm-agent", "-m", "http://manager:8138", "-g", "2"]
