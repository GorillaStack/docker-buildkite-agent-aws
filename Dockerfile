FROM buildkite/agent:2
MAINTAINER Elliott Spira <elliott@gorillastack.com>

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py

# Install AWSCLI
RUN pip install awscli

ENV NODE_VERSION 8.11.1
ENV NODE_PREFIX /usr/local

RUN set -x \
    && echo "http://dl-4.alpinelinux.org/alpine/v3.6/main/" > /etc/apk/repositories \
    #&& echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    #&& echo "http://dl-4.alpinelinux.org/alpine/v3.3/testing" >> /etc/apk/repositories \
    && echo "http://dl-4.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories \
    && apk update \
    && apk add \
        linux-headers \
        openssh \
        python \
        shadow \
        subversion \
        sudo \
        nodejs-npm \
        zip \
        jq \


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
