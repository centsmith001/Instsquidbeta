#!/bin/bash
apt-get update
apt-get upgrade -y
# Installing squid
apt-get install squid -y
# delete old squid file
rm -rf /etc/squid/squid.conf
touch /etc/squid/squid.conf
# Configure squid using EOF trick
cat <<eof> /etc/squid/squid.conf
http_access allow all
http_port 127.0.0.1:25800
cache_peer 127.0.0.1 parent 8000 7 no-query no-digest default
acl allsrc src 0.0.0.0/0.0.0.0
cache deny all
dns_nameservers 1.1.1.1 1.0.0.1
visible_hostname www.globe.com.ph
request_header_access Allow allow all
request_header_access Authorization allow all
request_header_access WWW-Authenticate allow all
request_header_access Proxy-Authorization allow all
request_header_access Proxy-Authenticate allow all
request_header_access Cache-Control allow all
request_header_access Content-Encoding allow all
request_header_access Content-Length allow all
request_header_access Content-Type allow all
request_header_access Date allow all
request_header_access Expires allow all
request_header_access Host allow all
request_header_access If-Modified-Since allow all
request_header_access Last-Modified allow all
request_header_access Location allow all
request_header_access Pragma allow all
request_header_access Accept allow all
request_header_access Accept-Charset allow all
request_header_access Accept-Encoding allow all
request_header_access Accept-Language allow all
request_header_access Content-Language allow all
request_header_access Mime-Version allow all
request_header_access Retry-After allow all
request_header_access Title allow all
request_header_access Connection allow all
request_header_access Proxy-Connection allow all
request_header_access User-Agent allow all
request_header_access Cookie allow all
request_header_access All deny all
eof
systemctl restart squid
Clear
echo -e '#=================================#'
echo -e '#     Installation Complete!      #'
echo -e '# You may edit your squid port at #'
echo -e '#     /etc/squid/squid.conf       #'
echo -e '#     Credits to Mr. Bon-chan     #'
echo -e '#=================================#'
exit 1