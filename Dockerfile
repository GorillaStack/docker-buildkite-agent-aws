FROM buildkite/agent:2
MAINTAINER Elliott Spira <elliott@gorillastack.com>

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py

# Install AWSCLI
RUN pip install awscli

# Install serverless
# Install npm as from here
# https://github.com/shadiakiki1986/docker-nginx-npm/blob/master/Dockerfile
# which is based on https://github.com/mkenney/docker-npm/blob/master/Dockerfile
# which is based on https://github.com/mhart/alpine-node/blob/master/Dockerfile

ENV NODE_VERSION 8.11.1
ENV NODE_PREFIX /usr/local

RUN set -x \
    && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk add \
        linux-headers \
        openssh \
        python \
        shadow \
        subversion \
        sudo \
        nodejs-npm \


    # Install node packages
    && npm install --silent -g \
        grunt-cli \
        serverless \

##############################################################################
# ~ fin ~
##############################################################################

    &&  apk del \
        linux-headers \
        python \

    && rm -rf /var/cache/apk/*
