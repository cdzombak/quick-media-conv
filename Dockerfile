FROM ubuntu:jammy
ARG BIN_VERSION=<unknown>

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates curl gnupg \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://dist.cdzombak.net/deb.key | gpg --dearmor -o /etc/apt/keyrings/dist-cdzombak-net.gpg \
    && chmod 0644 /etc/apt/keyrings/dist-cdzombak-net.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/dist-cdzombak-net.gpg] https://dist.cdzombak.net/deb/oss any oss" | tee /etc/apt/sources.list.d/dist-cdzombak-net.list > /dev/null \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         quick-media-conv="${BIN_VERSION}" ffmpeg imagemagick \
    && apt-get purge -y gnupg \
    && apt-get autoremove -y \
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
