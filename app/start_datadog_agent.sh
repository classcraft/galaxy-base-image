#!/bin/bash

set -e

if [ -z "$DD_API_KEY" ]; then
    echo "DD_API_KEY is not set."
else
    sudo sh -c "sed -i 's/api_key:.*/api_key: $DD_API_KEY/' /etc/datadog-agent/datadog.yaml"
    sudo sh -c "sed -i 's|SERVICE_NAME|$ROOT_URL|' /etc/datadog-agent/conf.d/nodejs.d/conf.yaml"
    mkdir /app/logs
    touch /app/logs/current
    datadog-agent start &

    echo "Datadog agent started"
fi
