#!/bin/sh
# Verify outbound internet connectivity by querying ifconfig.me.
# Output goes to stdout so it shows up in the container logs.

ENDPOINT=$NETCHECK_ENDPOINT
TIMEOUT=10

echo "[internet-check] Checking outbound internet access via ${ENDPOINT} ..."

# --fail: non-zero exit on HTTP errors
# --silent --show-error: quiet but still print errors
# --max-time: overall timeout
if RESPONSE=$(curl --fail --silent --show-error --max-time "${TIMEOUT}" "${ENDPOINT}"); then
  echo "[internet-check] SUCCESS: outbound internet is reachable."
  echo "[internet-check] Response: ${RESPONSE}"
else
  echo "[internet-check] FAILURE: could not reach ${ENDPOINT} (no outbound internet or endpoint down)."
fi
