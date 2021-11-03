FROM ubuntu:20.04

ENV LANG=C.UTF-8

RUN apt update && apt install -y \
    curl \
    bash

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && rm /var/log/lastlog /var/log/faillog



RUN curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash

RUN cp $HOME/yandex-cloud/bin/yc /usr/local/bin/

RUN curl -vL https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl


RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
USER ubuntu
WORKDIR /home/ubuntu

RUN mkdir -p /home/ubuntu/.local/bin \
    && echo 'export PATH="$PATH:$HOME/.local/bin"' >> /home/ubuntu/.bashrc
