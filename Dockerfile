FROM alpine:latest

RUN apk add --no-cache wget jq curl && \
    curl -s https://api.github.com/repos/github/codeql-action/releases/latest | jq -r ".assets[] | select(.name | contains(\"codeql-runner-linux\")) | .browser_download_url" | wget -i - && \
    chmod +x codeql-runner-linux && \
    mv codeql-runner-linux bin/codeql-runner-linux

CMD bash
