#!/usr/bin/env bash
# github-backup.sh — Optional GitHub handoff backup
# Enable by creating: memory/.github-backup-enabled

BACKUP_DIR="${MEMORY_DIR:-memory}/backups"
MARKER="${MEMORY_DIR:-memory}/.github-backup-enabled"
TODAY=$(date +%Y-%m-%d)
TIMESTAMP=$(date +%H%M)

if [ ! -f "$MARKER" ]; then
    echo "github-backup: disabled (create $MARKER to enable)"
    exit 0
fi

mkdir -p "$BACKUP_DIR"

DAILY_FILE="${MEMORY_DIR:-memory}/daily/${TODAY}.md"
if [ -f "$DAILY_FILE" ]; then
    BACKUP_FILE="${BACKUP_DIR}/handoff-${TODAY}-${TIMESTAMP}.md"
    cp "$DAILY_FILE" "$BACKUP_FILE"
    echo "github-backup: backed up to $BACKUP_FILE"
else
    echo "github-backup: no daily file found at $DAILY_FILE"
fi