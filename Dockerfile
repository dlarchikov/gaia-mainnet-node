FROM ubuntu:18.04

WORKDIR /app

RUN apt update && apt-get -y install curl git make

RUN curl https://dl.google.com/go/go1.13.linux-amd64.tar.gz > go1.13.linux-amd64.tar.gz

RUN  tar -xf go1.13.linux-amd64.tar.gz && cd go && mv ./* /usr/local

RUN mkdir -p /root/go/src/github.com/cosmos \
	&& cd /root/go/src/github.com/cosmos \
    && git clone https://github.com/cosmos/cosmos-sdk.git \
	&& cd /root/go/src/github.com/cosmos/cosmos-sdk \
	&& git checkout tags/v0.34.7

ENV LEDGER_ENABLED=false GOPATH=/root/go GOBIN=/root/go/bin PATH=$PATH:/root/go/bin

RUN mkdir -p /root/go/bin \
	&& cd /root/go/src/github.com/cosmos/cosmos-sdk \
	&& sed -i -e 's/go install -mod=readonly/go install/g' scripts/Makefile \
	&& make tools install \
	&& gaiad version --long \
	&& gaiacli version --long

ADD entrypoint.sh entrypoint.sh

CMD ["bash", "entrypoint.sh"]