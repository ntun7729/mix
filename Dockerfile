FROM ghcr.io/mhsanaei/3x-ui:v2.8.6

USER root

# Install required tools (Alpine)
RUN apk add --no-cache curl tar

# Install frpc v0.66.0
RUN curl -Ls -o /tmp/frp.tar.gz \
    https://github.com/fatedier/frp/releases/download/v0.66.0/frp_0.66.0_linux_amd64.tar.gz && \
    tar -xzf /tmp/frp.tar.gz -C /tmp && \
    mv /tmp/frp_0.66.0_linux_amd64/frpc /usr/local/bin/frpc && \
    chmod +x /usr/local/bin/frpc && \
    rm -rf /tmp/*

COPY frpc.toml /etc/frp/frpc.toml
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
