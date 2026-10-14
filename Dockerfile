# Test image: checks outbound internet via ifconfig.me (logged),
# and serves a Hello World page on the frontend.
FROM alpine:3.20

# curl for the connectivity check; busybox (bundled) provides httpd
RUN apk add --no-cache curl darkhttpd

# Frontend
COPY www/ /var/www/

# Scripts
COPY check-internet.sh /usr/local/bin/check-internet.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/check-internet.sh /usr/local/bin/entrypoint.sh

EXPOSE 8080

# Runs the internet check (to logs), then starts the web server
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
