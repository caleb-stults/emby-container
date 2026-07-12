#!/bin/bash

# 1. Load variables from the .env file in the root directory
# We assume the script is in /scripts, so we go up one level to find .env
source "$(dirname "$0")/../.env"

# 2. Check if variables are loaded (optional safety check)
if [ -z "$LOCAL_CONFIG" ] || [ -z "$BACKUP_PATH" ]; then
    echo "Error: LOCAL_CONFIG or BACKUP_PATH not set in .env"
    exit 1
fi

DATE=$(date +%Y-%m-%d)

# 3. Execution
docker compose -f "$(dirname "$0")/../docker-compose.yml" stop

tar -czvf "${BACKUP_PATH}/emby-backup-${DATE}.tar.gz" -C "$LOCAL_CONFIG" .

docker compose -f "$(dirname "$0")/../docker-compose.yml" start

# 4. Cleanup
find "$BACKUP_PATH" -type f -name "emby-backup-*.tar.gz" -mtime +30 -delete
