FROM python:slim-bookworm
#  Install all the requirements using pip
RUN   pip install --upgrade pip 
RUN   pip install rfswarm-agent 
RUN   pip install robotframework-requests 
RUN   pip install robotframework-datadriver
# Run the agent
ENTRYPOINT ["rfswarm-agent", "-m", "http://manager:8138", "-g", "2"]
