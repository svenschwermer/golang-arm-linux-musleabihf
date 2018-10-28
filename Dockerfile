FROM golang:stretch
RUN apt-get update && apt-get install -y \
    build-essential \
    flex \
    bison \
 && rm -rf /var/lib/apt/lists/*

COPY config.mak /tmp/
ENV MUSL_CROSS_MAKE_REV e3e354f63a8804cd88cce39db7132463ef2391c7
RUN curl -sL https://github.com/richfelker/musl-cross-make/archive/$MUSL_CROSS_MAKE_REV.tar.gz | tar -xzC /tmp \
 && cd /tmp/musl-cross-make-* \
 && mv /tmp/config.mak . \
 && make install \
 && cd /tmp && rm -rf musl-cross-make-*

