#!/usr/bin/env sh
echo 'Manager Started'
echo 'Running scenario.rfs file...'
DEFAULT_ARGS="-i /src/manager/manager.ini -s /src/manager/scenario.rfs -g  3  -n"
python   /root/.local/lib/python3.11/site-packages/rfswarm_manager/rfswarm.py $DEFAULT_ARGS "$@"
echo 'Manager down correctly'