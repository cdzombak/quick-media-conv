ARG BIN_VERSION=<unknown>

FROM ubuntu:jammy

RUN curl -s https://packagecloud.io/install/repositories/cdzombak/oss/script.deb.sh?any=true | bash \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends -y \
       bash ffmpeg imagemagick quick-media-conv=${BIN_VERSION} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

VOLUME /work

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0555 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

LABEL license="LGPL3"
LABEL maintainer="Chris Dzombak <https://www.dzombak.com>"
LABEL org.opencontainers.image.authors="Chris Dzombak <https://www.dzombak.com>"
LABEL org.opencontainers.image.url="https://github.com/cdzombak/quick-media-conv"
LABEL org.opencontainers.image.documentation="https://github.com/cdzombak/quick-media-conv/blob/main/README.md"
LABEL org.opencontainers.image.source="https://github.com/cdzombak/quick-media-conv.git"
LABEL org.opencontainers.image.version="${BIN_VERSION}"
LABEL org.opencontainers.image.licenses="LGPL3"
LABEL org.opencontainers.image.title="quick-media-conv"
LABEL org.opencontainers.image.description="Scripts for quick ffmpeg/imagemagick conversions"
