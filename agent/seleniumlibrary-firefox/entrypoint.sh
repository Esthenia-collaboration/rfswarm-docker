#!/bin/sh
# Add display configuration in case user want to display browser interface
export DISPLAY=:0
rm -rf  /tmp/.X0-lock  # To remove the lock in case where the GUI server is already running
GEOMETRY="${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_DEPTH}"
Xvfb :0 -screen 0 $GEOMETRY -nolisten tcp &
DEFAULT_ARGS="-m http://manager:8138 -g 2 -p container:docker"
echo "Running rfswarm-agent..."
# Use the default args and overwrite them with user arguments
rfswarm-agent $DEFAULT_ARGS "$@"

