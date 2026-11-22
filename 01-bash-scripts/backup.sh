#!/bin/bash


SOURCE_DIR="$1"
BACKUP_DIR="$HOME/backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

if [ -z "$SOURCE_DIR" ]; then
  echo "Uzycie: $0 <sciezka_do_katalogu>"
  exit 1
fi

mkdir -p "$BACKUP_DIR"
ARCHIVE_NAME="backup_$(basename "$SOURCE_DIR")_$DATE.tar.gz"

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
  echo "[OK] Utworzono kopie zapasowa: $BACKUP_DIR/$ARCHIVE_NAME"
else
  echo "[BLAD] Nie udalo sie utworzyc kopii katalogu: $SOURCE_DIR"
  exit 2
fi
