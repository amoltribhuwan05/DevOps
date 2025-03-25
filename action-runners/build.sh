#!/bin/bash
RUNNER_VERSION=$(curl -s -I https://github.com/actions/runner/releases/latest | \
        grep -i location | \
        awk -F'/' '{print $NF}' | \
        sed 's/^v//' | \
        tr -d '\r\n' | \
        grep -E '^[0-9]+\.[0-9]+\.[0-9]+$')

echo "Github-action-version=$RUNNER_VERSION"

docker build --build-arg RUNNER_VERSION=$RUNNER_VERSION -t actions-runner .