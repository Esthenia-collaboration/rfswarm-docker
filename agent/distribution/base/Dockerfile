FROM python:slim-bookworm
#  Copy requirements file into the /src repository
COPY requirements.txt /src/requirements.txt
RUN   pip install --upgrade pip && pip install --no-cache-dir  -r /src/requirements.txt
# Run the agent
ENTRYPOINT ["rfswarm-agent", "-m", "http://manager:8138", "-g", "3"]
