#!/bin/bash
set -e

# Configure the runner
./config.sh \
    --url ${RUNNER_REPOSITORY_URL} \
    --token ${RUNNER_TOKEN} \
    --name $(hostname) \
    --work _work \
    --unattended \
    --replace

# Install Runner as a service
./svc.sh install

# Start the Runner service
./svc.sh start

# Prevent the container from exiting
tail -f /dev/null
