FROM ubuntu:20.04

ARG RUNNER_VERSION
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y && useradd -m docker
WORKDIR /home/docker/actions-runner

RUN apt install -y --no-install-recommends \
    curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip
RUN curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh
RUN chmod +x start.sh

USER docker
ENTRYPOINT ["./start.sh"]