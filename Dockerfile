FROM buildkite/agent
MAINTAINER Elliott Spira <elliott@gorillastack.com>

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py

# Install AWSCLI
RUN pip install awscli
