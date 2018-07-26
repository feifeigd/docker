FROM gcc-alpine

RUN apk --no-cache add --virtual .build-deps \
    autoconf \
    readline-dev \
    && git clone https://github.com/feifeigd/skynet.git && cd skynet && make linux 

ENV SKYNET_ROOT /skynet
ENV PATH $SKYNET_ROOT:$PATH

WORKDIR /skynet
# ENTRYPOINT ["skynet"]
CMD ["skynet", "examples/config"]

