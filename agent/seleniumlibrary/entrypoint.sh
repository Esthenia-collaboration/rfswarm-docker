#!/bin/sh

# This file launched rfswarm agent with default or user arguments
DEFAULT_ARGS="-m http://manager:8138 -g 2 -p container:docker"
echo "Running rfswarm-agent..."
# Use the default args and overwrite them with user arguments
rfswarm-agent $DEFAULT_ARGS "$@"
