FROM ubuntu:latest

VOLUME /terraform

ENV terraform_version 0.13.4
ENV vault_version 1.5.4
ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update && \
    apt-get install -y docker wget curl unzip jq python3 python3-pip git bash dpkg && \
    #wget https://releases.hashicorp.com/terraform/$terraform_version/terraform_${terraform_version}_linux_amd64.zip && \
    #unzip terraform_${terraform_version}_linux_amd64.zip -d bin/ && \
    #rm terraform_${terraform_version}_linux_amd64.zip && \
    #wget https://releases.hashicorp.com/vault/${vault_version}/vault_${vault_version}_linux_amd64.zip && \
    #unzip vault_${vault_version}_linux_amd64.zip -d bin/ && \
    #rm vault_${vault_version}_linux_amd64.zip && \
    #curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    #vault --version && \
    #terraform --version && \
    #az --version && \
    #curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin && \
    #trivy filesystem --exit-code 0 --severity LOW,MEDIUM,HIGH --no-progress . && \
    #trivy filesystem --exit-code 1 --severity CRITICAL --no-progress . && \
    VERSION=$(curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' \ ) && \
    curl -L -o dockle.deb https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.deb && \
    dpkg -i dockle.deb && rm dockle.deb

WORKDIR /terraform

CMD bash
