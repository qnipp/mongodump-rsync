#!/bin/bash

DATE=$(date +"%Y%m%d")
BACKUP_FILE="$TARBZ2_PATH/$DATE.tar.bz2"

mongodump --uri="$MONGO_URL" $MONGO_DUMP_OPTIONS -o "$DUMP_PATH/$DATE"
cd "$DUMP_PATH"
tar cvfj "$BACKUP_FILE" .

mkdir ~/.ssh
cp -r $SSH_DIR/* ~/.ssh
chmod 600 ~/.ssh/id_rsa

rsync -vz "$BACKUP_FILE" "$RSYNC_TARGET/"