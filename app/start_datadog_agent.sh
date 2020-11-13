#!/bin/bash

set -e

if [ -z "$DD_API_KEY" ]; then
    echo "DD_API_KEY is not set."
else
    sudo sh -c "sed -i 's/api_key:.*/api_key: $DD_API_KEY/' /etc/datadog-agent/datadog.yaml"
    initctl start datadog-agent

    echo "Datadog agent started"
fi
