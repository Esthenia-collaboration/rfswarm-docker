!/bin/bash
# This command launch the agent container
# python /usr/local/lib/python3.12/site-packages/rfswarm_agent/rfswarm_agent.py  -i /src/$AGENT_INI_FILE  -r $ROBOT_EXE_LOCAL_PATH  -g $AGENT_LOG_LEVEL
rfswarm-agent  -i /src/$AGENT_INI_FILE  -r $ROBOT_EXE_LOCAL_PATH  -g $AGENT_LOG_LEVEL