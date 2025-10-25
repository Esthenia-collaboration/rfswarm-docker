#!/usr/bin/env sh
echo 'Init secured ssh container...'
#check sshd folder existance
mkdir -p /var/run/sshd
#run sshd in daemon mode
echo 'Start ssh server'
exec /usr/sbin/sshd -D  &

echo 'Manager Started'
echo 'Running scenario.rfs file...'
DEFAULT_ARGS="-i /src/manager/manager.ini -g 3 -n"
python   /root/.local/lib/python3.13/site-packages/rfswarm_manager/rfswarm.py $DEFAULT_ARGS "$@"
echo 'Manager down correctly'
