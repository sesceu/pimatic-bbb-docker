FROM resin/armv7hf-debian-qemu
MAINTAINER Sebastian Schneider <mail@sesc.eu>

RUN [ "cross-build-start" ]

RUN apt-get update && \
    apt-get install -y apt-utils

RUN apt-get install -y curl git python build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate -O nodejs.tar.gz https://nodejs.org/dist/v0.10.5/node-v0.10.5-linux-arm-pi.tar.gz
RUN tar xf nodejs.tar.gz -C /usr/local/ --strip-components 1
RUN git config --global http.sslVerify false

RUN mkdir -p /home/pimatic/pimatic-app && \
    touch /home/pimatic/pimatic-app/.npmignore && \
    cd /home/pimatic && \
    npm install -g npm && \
    npm install pimatic --prefix pimatic-app --production && \
    cp pimatic-app/node_modules/pimatic/config_default.json pimatic-app/config.json

RUN sed -i "s/\"password\": \"\"/\"password\": \"admin\"/g" /home/pimatic/pimatic-app/config.json

COPY ~/pimatic_initialize.patch /home/pimatic/
RUN patch pimatic-app/node_modules/pimatic.js pimatic_initlialize.patch && \
    ./node_modules/pimatic/pimatic.js initialize

RUN [ "cross-build-end" ]

EXPOSE 80


