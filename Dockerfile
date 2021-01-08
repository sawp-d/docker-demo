FROM ubuntu:latest

VOLUME /terraform

ENV terraform_version 0.13.4
ENV vault_version 1.5.4
ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update && \
    apt-get install -y docker wget curl unzip jq python3 python3-pip git bash && \
    wget https://releases.hashicorp.com/terraform/$terraform_version/terraform_${terraform_version}_linux_amd64.zip && \
    unzip terraform_${terraform_version}_linux_amd64.zip -d bin/ && \
    rm terraform_${terraform_version}_linux_amd64.zip && \
    wget https://releases.hashicorp.com/vault/${vault_version}/vault_${vault_version}_linux_amd64.zip && \
    unzip vault_${vault_version}_linux_amd64.zip -d bin/ && \
    rm vault_${vault_version}_linux_amd64.zip && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    vault --version && \
    terraform --version && \
    az --version && \
    curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin && \
    trivy fs --exit-code 1 --no-progress

WORKDIR /terraform

CMD bash
