FROM ubuntu:latest

VOLUME /terraform

ENV terraform_version 0.13.4
ENV vault_version 1.5.4
ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update && \
    apt-get install -y docker curl unzip jq python3 git bash && \
    curl https://releases.hashicorp.com/terraform/$terraform_version/terraform_${terraform_version}_linux_amd64.zip && \
    unzip terraform_${terraform_version}_linux_amd64.zip -d bin/ && \
    rm terraform_${terraform_version}_linux_amd64.zip && \
    curl https://releases.hashicorp.com/vault/${vault_version}/vault_${vault_version}_linux_amd64.zip && \
    unzip vault_${vault_version}_linux_amd64.zip -d bin/ && \
    rm vault_${vault_version}_linux_amd64.zip && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash

WORKDIR /terraform

CMD bash
