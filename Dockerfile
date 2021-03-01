FROM alpine:latest

VOLUME /codeql-runner-linux

RUN apk add --no-cache wget jq curl && \
    curl -s https://api.github.com/repos/github/codeql-action/releases/latest | jq -r ".assets[] | select(.name | contains(\"codeql-runner-linux\")) | .browser_download_url" | wget -i - -P bin/

WORKDIR /codeql-runner-linux

CMD bash
