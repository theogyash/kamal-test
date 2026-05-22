# #!/bin/bash
# set -x
# echo "=== DEBUG: script started ==="
# date

# echo "DEBUG: LOCAL_SERVICE='${LOCAL_SERVICE}'"
# echo "DEBUG: LOCAL_IP='${LOCAL_IP}'"
# echo

# #RAW_LIST=$(docker exec kamal-proxy kamal-proxy list)
# echo "DEBUG: RAW_LIST output:"
# echo "$RAW_LIST"
# echo "---------------------------"

# #EXTRA_SERVICES=$(echo "$RAW_LIST" | awk 'NR>1 {print $1}' | grep -E "${LOCAL_SERVICE}-web-[0-9]+" | tr -d '\r')

# RAW_LIST=$(docker exec kamal-proxy kamal-proxy list | sed 's/\x1b\[[0-9;]*m//g')

# EXTRA_SERVICES=$(echo "$RAW_LIST" | awk 'NR>1 {print $1}' | grep -E "${LOCAL_SERVICE}-web-[0-9]+" | tr -d '\r')

# for EXTRA in $EXTRA_SERVICES; do
#     [ -z "$EXTRA" ] && continue
#     echo "DEBUG: Removing -> [$EXTRA]"
#     docker exec kamal-proxy kamal-proxy remove "$EXTRA"
# done


# echo "DEBUG: EXTRA_SERVICES:"
# echo "$EXTRA_SERVICES"
# echo "---------------------------"

# #for EXTRA in $EXTRA_SERVICES; do
# #    echo "DEBUG: Processing EXTRA='$EXTRA'"
# #    if [ -z "$EXTRA" ]; then
# #        echo "DEBUG: EXTRA is empty, skipping"
# #        continue
# #    fi

# #    echo "DEBUG: Running -> docker exec -t kamal-proxy kamal-proxy remove \"$EXTRA\""
# #    docker exec  kamal-proxy kamal-proxy remove "$EXTRA"
# #done

# WEB_IDS=$(docker ps \
#   --filter "label=service=$LOCAL_SERVICE" \
#   --filter "status=running" \
#   --format "{{.ID}} {{.Label \"role\"}}" \
#   | grep "web" \
#   | awk '{print $1}' \
#   | tr -d '\r')

# echo "DEBUG: WEB_IDS:"
# echo "$WEB_IDS"
# echo "---------------------------"

# TARGET_FLAGS=""
# for ID in $WEB_IDS; do
#     echo "DEBUG: Adding target for container ID='$ID'"
#     TARGET_FLAGS="$TARGET_FLAGS --target $ID:3000"
# done

# echo "DEBUG: TARGET_FLAGS='$TARGET_FLAGS'"
# echo "---------------------------"

# echo "DEBUG: About to run deploy command:"
# echo "docker exec kamal-proxy kamal-proxy deploy \"${LOCAL_SERVICE}-web\" $TARGET_FLAGS --host \"${LOCAL_IP}\""
# echo "---------------------------"

# docker exec kamal-proxy kamal-proxy deploy "${LOCAL_SERVICE}-web" $TARGET_FLAGS --host "$LOCAL_IP"

# echo "DEBUG: Deploy finished"
# echo "---------------------------"

# docker exec kamal-proxy kamal-proxy list

# echo "=== DEBUG: script finished ==="

# docker exec kamal-proxy sh -c '
#   echo "ARGV:"
#   for arg in "$@"; do
#     echo "[$arg]"
#   done
#   kamal-proxy remove "$@"
# ' sh "$EXTRA"


# docker exec kamal-proxy sh -c '
#   echo "CMDLINE:"
#   cat /proc/$$/cmdline | tr "\0" "\n"
#   kamal-proxy remove "$1"
# ' sh "$EXTRA"



# echo "DEBUG: EXTRA raw value: [$EXTRA]"
# echo "DEBUG: EXTRA length: ${#EXTRA}"
# echo "DEBUG: EXTRA bytes:"
# echo -n "$EXTRA" | od -c
# echo "DEBUG: EXTRA quoted by shell: ['$EXTRA']"