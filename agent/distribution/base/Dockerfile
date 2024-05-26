FROM python:slim-bookworm
ENV     PYTHONPATH="${PYTHONPATH}:/src/:/usr/local/bin"
ENV     PATH="${PATH}:~/usr/local/bin:/src"
# Add python dependency
RUN     apt-get -y update && apt-get install -y apt-utils bc curl wget libaio1 unzip gcc netcat-traditional bash build-essential \
python3-pip python3-pip python-dev-is-python3 python3-pil 
#  Copy requirements file in the /src repository
COPY requirements.txt /src/requirements.txt
RUN   pip install --upgrade pip && pip install --no-cache-dir  -r /src/requirements.txt
# Run the agent 
ENTRYPOINT ["rfswarm-agent", "-m", "http://manager:8138", "-g", "3"]
