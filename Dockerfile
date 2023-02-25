FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# build xmrig
RUN git clone https://github.com/ZhangGaoxing/xmrig-C3.git --depth=1
WORKDIR /xmrig-C3/build
RUN cmake .. && \
    make -j$(nproc)

RUN mkdir /xmrig /xmrig/configs && \
    cp xmrig /xmrig && \
    cp config.json /xmrig/configs
RUN rm -rf /xmrig-C3
RUN apt-get purge -y git build-essential cmake && \
    apt-get autoremove -y

WORKDIR /xmrig
CMD ["/xmrig/xmrig", "--config=/xmrig/configs/config.json"]
