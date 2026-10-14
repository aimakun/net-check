#!/bin/sh
# Run the outbound internet check (logged to container logs),
# then serve the Hello World frontend.

/usr/local/bin/check-internet.sh

echo "[server] Starting Hello World server on port 8080 ..."
exec darkhttpd /var/www --port 8080
