#!/bin/sh
export DISPLAY=:0
GEOMETRY="${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_DEPTH}"
Xvfb :0 -screen 0 $GEOMETRY -nolisten tcp &
robot -d /src/product/tests/reports  /src/product/tests/selenium_firefox_test.robot