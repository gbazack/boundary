ARG UBUNTU_VERSION=24.04
FROM ubuntu:${UBUNTU_VERSION}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get autoclean -y \
    && apt-get install -y \
    gnupg2 \
    curl \
    lsb-release \
    systemctl \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update -y \
    && apt-get install boundary \
    && apt-get autoremove -y

COPY ./controller/boundary.service /etc/systemd/system/boundary.service

RUN chown -R boundary:boundary /etc/boundary.d \
    && systemctl daemon-reload \
    && systemctl enable boundary.service

EXPOSE 9200 9201

CMD [ "bash" ]