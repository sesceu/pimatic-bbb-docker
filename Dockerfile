FROM resin/armv7hf-debian-qemu
MAINTAINER Sebastian Schneider <mail@sesc.eu>

RUN [ "cross-build-start" ]

RUN apt-get update && \
    apt-get install -y apt-utils

RUN apt-get install -y curl git python build-essential && \
    rm -rf /var/lib/apt/lists/*

#    apt-get install -y build-essential curl apt-utils git dialog wget python && \
RUN curl -sL https://nodejs.org/dist/v0.10.5/node-v0.10.5-linux-arm-pi.tar.gz > nodejs.tar.gz
RUN tar xf nodejs.tar.gz -C /usr/local/ --strip-components 1
RUN git config --global http.sslVerify false

RUN mkdir -p /home/pimatic/pimatic-app && \
    touch /home/pimatic/pimatic-app/.npmignore && \
    cd /home/pimatic && \
    npm install -g npm && \
    npm install pimatic --prefix pimatic-app --production && \
    cp pimatic-app/node_modules/pimatic/config_default.json pimatic-app/config.json

RUN sed -i "s/\"password\": \"\"/\"password\": \"admin\"/g" /home/pimatic/pimatic-app/config.json

RUN [ "cross-build-end" ]

EXPOSE 80


