FROM rastasheep/ubuntu-sshd:16.04
MAINTAINER saiaaaaaa
ENV ID=98466dfd-2580-4a8c-ac46-c44a9ac7aaa8

RUN apt update && apt install unzip -y && mkdir /root/v2ray && wget -P /root/v2ray "https://github.com/v2ray/v2ray-core/releases/download/v4.20.0/v2ray-linux-64.zip" && unzip /root/v2ray/v2ray-linux-64.zip -d /root/v2ray && rm -f /root/v2ray/config.json && rm -f /root/v2ray/v2ray-linux-64.zip \
&& echo '{"inbound":{"port":443,"protocol":"vmess","settings":{"clients":[{"id":"${ID}","alterId":64}]},"streamSettings":{"network":"ws"}},"outbound":{"protocol":"freedom","settings":{}}}' > /root/v2ray/config.json \
&& chmod -R 755 /root/v2ray
ENTRYPOINT ["/root/v2ray/v2ray", "-config=/root/v2ray/config.json"]
