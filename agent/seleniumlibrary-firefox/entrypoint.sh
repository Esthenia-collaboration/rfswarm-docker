#!/bin/sh
export DISPLAY=:0
rm -rf  /tmp/.X0-lock  # To remove the lock in case where the GUI server is already running
GEOMETRY="${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_DEPTH}"
Xvfb :0 -screen 0 $GEOMETRY -nolisten tcp &
echo "Test is launched"
robot -d /tmp/reports/ /tmp/selenium_firefox_test.robot
echo "Test completed"