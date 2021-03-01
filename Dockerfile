FROM ubuntu:latest

RUN apt-get update && \
    apt-get install wget jq curl && \
    curl -s https://api.github.com/repos/github/codeql-action/releases/latest | jq -r ".assets[] | select(.name | contains(\"codeql-runner-linux\")) | .browser_download_url" | wget -i - && \
    chmod +x codeql-runner-linux && \
    mv codeql-runner-linux bin/codeql-runner-linux && \
    rm -rf /var/lib/apt/lists/*

RUN codeql-runner-linux --help

CMD bash
