# Use Ubuntu as the base image
FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    git \
    jq \
    tar \
    unzip \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Create a folder for the GitHub Runner
WORKDIR /actions-runner

# Download the latest GitHub Actions Runner
RUN curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v2.288.1/actions-runner-linux-x64-2.288.1.tar.gz \
    && tar xzf ./actions-runner-linux-x64.tar.gz \
    && rm actions-runner-linux-x64.tar.gz

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
