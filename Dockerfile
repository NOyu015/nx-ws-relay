FROM alpine:3.20
RUN apk add --no-cache curl unzip ca-certificates \
 && curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.10.31/Xray-linux-64.zip \
 && unzip -o /tmp/xray.zip -d /tmp/xr \
 && install -m 755 /tmp/xr/xray /usr/local/bin/xray \
 && rm -rf /tmp/xr /tmp/xray.zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
