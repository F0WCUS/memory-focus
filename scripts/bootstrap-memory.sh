#!/usr/bin/env bash
# bootstrap-memory.sh — Create memory/ directory structure
# Run once to set up the initial memory folder

MEMORY_DIR="${MEMORY_DIR:-memory}"

echo "bootstrap-memory: creating memory directory structure at $MEMORY_DIR/"

mkdir -p "$MEMORY_DIR/daily"
mkdir -p "$MEMORY_DIR/backups"

# Create placeholder files
touch "$MEMORY_DIR/loops.md"
touch "$MEMORY_DIR/.focus-active"  # Will be deleted by agent on first END
touch "$MEMORY_DIR/.timezone"       # Agent will ask and fill this in

# Create a starter MEMORY.md if it doesn't exist
if [ ! -f "MEMORY.md" ]; then
    cat > "MEMORY.md" << 'MEMEOF'
# MEMORY.md — Long-Term Memory

<!-- Decisions promoted from sessions are logged here with date and source. -->

## Key Decisions

<!-- Format: - [[YYYY-MM-DD]] Decision description (source: memory/daily/YYYY-MM-DD.md) -->

## Active Projects

<!-- Format: - [[project-name]] Brief description -->

## Notes

<!-- Anything that won't fit in daily logs but matters long-term -->
MEMEOF
    echo "bootstrap-memory: created MEMORY.md"
fi

echo "bootstrap-memory: done"
echo ""
echo "Created:"
echo "  $MEMORY_DIR/"
echo "  $MEMORY_DIR/daily/"
echo "  $MEMORY_DIR/backups/"
echo "  $MEMORY_DIR/loops.md"
echo "  $MEMORY_DIR/.focus-active"
echo "  $MEMORY_DIR/.timezone"
[ -f "MEMORY.md" ] && echo "  MEMORY.md"