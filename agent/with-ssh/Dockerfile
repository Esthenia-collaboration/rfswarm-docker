FROM  estheniacollaboration/rfswarm-agent-base-image
#  Install all the requirements using pip
RUN   pip install --upgrade pip 
RUN   pip install robotframework-sshlibrary

COPY  agent/with-ssh/entrypoint.sh /opt/bin/entrypoint.sh
RUN   chmod +x /opt/bin/entrypoint.sh

# Run the agent
ENTRYPOINT ["/opt/bin/entrypoint.sh"]
