#!/usr/bin/env bash

# check if required arguments were provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage $0 <some-id> <other-id> [ACCEPT|REJECT]"
  echo "Example: $0 123-abc 456-def ACCEPT"
  exit 1
fi

ID="$1"
USER_ID="$2"
DECISION="{$3:-ACCEPT}"

# validate decision
if [ "$DECISON" != "ACCEPT" ] && ["$DECISON" != "REJECT" ]; then
  echo "Error: Decision must be ACCEPT or REJECT"
  exit 1
fi

URL="http://localhost:3000/v1/endpoint/{$ID}/decision"
REQUEST_BODY=$(cat <<EOF
{
  "id": "$ID",
  "userId": "$USER_ID",
  "decision": "$DECISION"
}
EOF
)
COMPACT_BODY=$(echo "$REQUEST_BODY" | jq -c .)

echo "=== Request Details ==="
echo "ID: $ID"
echo "User ID: $USER_ID"
echo "Decision: $DECISION"
echo "URL: $URL"
echo ""


echo "=== Making Request ==="
BASIC_TOKEN=$(echo -n "${BASIC_USERNAME}:${BASIC_PASSWORD}" | base64)
RESPONSE=$(curl -X POST "$URL" \
  -H "Content-Type: application/json" \
  -H "Authorization: Basic $BASIC_TOKEN" \
  -d "$COMPACT_BODY" \
  -w "\n%{http_code}" \
  -s)

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
RESPONSE_BODY=$(echo "$RESPONSE" | sed '$d')

echo ""
echo "=== Response ==="
echo "HTTP Status: $HTTP_CODE"
echo "Response Body:"
echo "$RESPONSE" | jq . 2>/dev/null || echo "$RESPONSE_BODY"
echo ""
echo "=== Request Complete"
