#!/bin/bash
PROJ_PATH=/Users/yash/Desktop/kamal-go-dynamic
cd "$PROJ_PATH"
export SERVER_IP=43.205.236.227


# --- 3. Execute Kamal ---
# kamal lock release
# kamal hooks -help
# kamal setup
kamal deploy --verbose

# WEB_IDS=$(docker ps \
#   --filter "label=service=$LOCAL_SERVICE" \
#   --filter "status=running" \
#   --format "{{.ID}} {{.Label \"role\"}}" \
#   | grep "web" \
#   | awk '{print $1}' \
#   | tr -d '\r')

# TARGET_FLAGS=""
# for ID in $WEB_IDS; do
#     TARGET_FLAGS="$TARGET_FLAGS --target $ID:3000"
# done