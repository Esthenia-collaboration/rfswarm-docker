#!/usr/bin/env sh
# set -x

ARGS="$@"

# default values
CONFIG_FILE=${CONFIG_FILE:-/src/manager/configuration/manager.ini}
SCENARIO_FILE=${SCENARIO_FILE}
PORT=${PORT:-8138}
LOG_LEVEL=${LOG_LEVEL:-0}
DISPLAY_GUI=${DISPLAY_GUI:-false}
RUN_AUTOMATICALLY=${RUN_AUTOMATICALLY:-false}

if [ -n "$SCENARIO_FILE" ]; then
    ARGS="--scenario $SCENARIO_FILE $ARGS"
fi

# convert DISPLAY_GUI to lower case
DISPLAY_GUI_LOWER=$(echo "$DISPLAY_GUI" | tr '[:upper:]' '[:lower:]')
if [ "$DISPLAY_GUI_LOWER" = "true" ] || [ "$DISPLAY_GUI_LOWER" = "yes" ] || [ "$DISPLAY_GUI_LOWER" = "1" ]; then
    echo "GUI activated"
else
    ARGS="--nogui $ARGS"
fi

# convert RUN_AUTOMATICALLY to lower case
RUN_AUTOMATICALLY_LOWER=$(echo "$RUN_AUTOMATICALLY" | tr '[:upper:]' '[:lower:]')
if [ "$RUN_AUTOMATICALLY_LOWER" = "true" ] || [ "$RUN_AUTOMATICALLY_LOWER" = "yes" ] || [ "$RUN_AUTOMATICALLY_LOWER" = "1" ]; then
    echo "Run the scenario automatically after loading"
    ARGS="--run $ARGS"
fi

echo 'Manager Started'
COMMAND="python rfswarm.py --port $PORT --ini $CONFIG_FILE --debug $LOG_LEVEL $ARGS"
echo "Run commande ==> $COMMAND"
exec $COMMAND
echo 'Manager down correctly'
 