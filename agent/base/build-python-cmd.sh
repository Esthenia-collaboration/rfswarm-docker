#!/bin/bash

# This script can be sourced or executed directly
build_and_run_python_cmd() {
    local PYTHON_CMD="rfswarm-agent"
    
    # Map environment variables to arguments

    # convert XMLMODE to lower case
    XMLMODE_LOWER=$(echo "$XMLMODE" | tr '[:upper:]' '[:lower:]')
    if [ "$XMLMODE_LOWER" = "true" ] || [ "$XMLMODE_LOWER" = "yes" ] || [ "$XMLMODE_LOWER" = "1" ]; then
        echo "fall back to pasing the output.xml after each iteration"
        PYTHON_CMD="$PYTHON_CMD --xmlmode"
    fi

    if [ -n "$MANAGER" ]; then
        PYTHON_CMD="$PYTHON_CMD --manager $MANAGER"
    fi
    
    if [ -n "$LOG_LEVEL" ]; then
        PYTHON_CMD="$PYTHON_CMD --debug $LOG_LEVEL"
    fi
    
    if [ -n "$CONFIG_FILE" ]; then
        PYTHON_CMD="$PYTHON_CMD --ini $CONFIG_FILE"
    fi
    
    if [ -n "$AGENTDIR" ]; then
        PYTHON_CMD="$PYTHON_CMD --agentdir $AGENTDIR"
    fi
    
    if [ -n "$ROBOT" ]; then
        PYTHON_CMD="$PYTHON_CMD --robot $ROBOT"
    fi

    if [ -n "$AGENTNAME" ]; then
        PYTHON_CMD="$PYTHON_CMD --agentname $AGENTNAME"
    fi

    if [ -n "$PROPERTY" ]; then
        PYTHON_CMD="$PYTHON_CMD --property $PROPERTY"
    fi
    
    # Add additional arguments passed as parameters
    PYTHON_CMD="$PYTHON_CMD $@"
    
    echo "Run command: $PYTHON_CMD"
    exec $PYTHON_CMD
}

# If the script is executed directly (not sourced)
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    build_and_run_python_cmd "$@"
fi
