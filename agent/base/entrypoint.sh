#!/bin/bash

set -e

echo "=== Base Image - Starting ==="

# Execute initialization hooks if present (for child images)
if [ -d "/docker-entrypoint-init.d" ]; then
    for script in /docker-entrypoint-init.d/*.sh; do
        if [ -f "$script" ]; then
            echo "Executing hook: $(basename $script)"
            source "$script"
        fi
    done
fi

# Launch the Python command
exec build-python-cmd.sh "$@"
