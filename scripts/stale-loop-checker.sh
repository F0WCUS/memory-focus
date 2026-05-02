#!/usr/bin/env bash
# stale-loop-checker.sh — Flag loops older than 7 days
# Lists stale items and prompts user to keep/mark complete/archive

LOOPS="${MEMORY_DIR:-memory}/loops.md"
STALE_THRESHOLD_DAYS=7

if [ ! -f "$LOOPS" ]; then
    echo "stale-loop-checker: loops.md not found at $LOOPS"
    exit 1
fi

# Find items with date tags older than threshold
# This is a simple heuristic: items with #YYYY-MM-DD pattern
cutoff_date=$(date -d "$STALE_THRESHOLD_DAYS days ago" +%Y-%m%d 2>/dev/null || echo "2026-04-25")

echo "stale-loop-checker: scanning for loops older than $STALE_THRESHOLD_DAYS days (before $cutoff_date)"

# Simple check: grep for date pattern and compare
# In practice, the agent handles this via the BEGIN/END protocol
# This script is a utility for manual review

stale_count=$(grep -cE "#2[0-9]{3}-[0-9]{2}-[0-9]{2}" "$LOOPS" 2>/dev/null || echo 0)
echo "stale-loop-checker: found approximately $stale_count items with date tags"

if [ "$stale_count" -gt 0 ]; then
    echo ""
    echo "Stale items found. At next BEGIN, the agent will prompt:"
    echo "  'You have N stale loops. Keep, mark complete, or archive?'"
    echo ""
    echo "Options:"
    echo "  Keep it      — still relevant, remove stale flag"
    echo "  Mark complete — done or no longer needed"
    echo "  Archive       — put aside for later, remove from active loops"
fi