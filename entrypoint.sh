#!/bin/sh
PORT="${PORT:-8080}"
cat > /tmp/config.json <<JSON
{
  "log": { "loglevel": "warning" },
  "inbounds": [
    {
      "listen": "0.0.0.0",
      "port": ${PORT},
      "protocol": "vless",
      "settings": { "clients": [ { "id": "${UUID}", "flow": "" } ], "decryption": "none" },
      "streamSettings": { "network": "ws", "wsSettings": { "path": "${WSPATH}" } }
    }
  ],
  "outbounds": [ { "protocol": "freedom" } ]
}
JSON
exec /usr/local/bin/xray run -config /tmp/config.json
