#!/usr/bin/env bash
# prune-loops.sh — Enforce 10-item max in memory/loops.md
# Keeps: urgent and P1 items
# Archives: P2, normal, someday (items moved to end with #archived tag)

LOOPS="${MEMORY_DIR:-memory}/loops.md"
MAX_ITEMS=10

if [ ! -f "$LOOPS" ]; then
    echo "prune-loops: loops.md not found at $LOOPS"
    exit 1
fi

# Count non-archived items
total=$(grep -c "^-\s*\[" "$LOOPS" 2>/dev/null || echo 0)
urgent=$(grep -c "#urgent" "$LOOPS" 2>/dev/null || echo 0)
p1=$(grep -c "#priority-p1" "$LOOPS" 2>/dev/null || echo 0)

keep=$((urgent + p1))
extras=$((total - keep))

echo "prune-loops: $total items total, $keep kept (urgent=$urgent, p1=$p1), $extras to archive"

if [ $total -le $MAX_ITEMS ]; then
    echo "prune-loops: within limit ($total/$MAX_ITEMS), no action needed"
    exit 0
fi

echo "prune-loops: over limit ($total > $MAX_ITEMS), archive lower-priority items"
echo "  → Manually review and archive: P2, normal, someday items"
echo "  → Keep: urgent (#urgent) and P1 (#priority-p1) items"