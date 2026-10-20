# Minimal Docker image for seqtk using Alpine base
FROM alpine:latest

# install seqtk
RUN apk update && \
    apk add --no-cache bash gcc make musl-dev zlib-dev && \
    wget -qO- "https://github.com/lh3/seqtk/archive/refs/tags/v1.5.tar.gz" | tar -zx && \
    cd seqtk-* && \
    make && \
    chmod a+x seqtk && \
    mv seqtk /usr/local/bin/ && \
    cd .. && \
    rm -rf seqtk-*
