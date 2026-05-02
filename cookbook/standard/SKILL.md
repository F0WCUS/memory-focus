---
name: cookbook-standard
description: "Recommended F0WCUS setup: full framework with 3-tier priority loops, #decision tagging, session templates, auto GitHub backup, and 1% Better (every 5 sessions)."
license: MIT
metadata:
  author: Todd (mf-st-thad-v1 synthesis)
  version: "1.0"
  triggers:
    - cookbook standard
  category: memory/recipe
---

# Standard Recipe — F0WCUS Default

**Recommended setup. Full framework with auto GitHub backup.**

## What's Included
- Full `BEGIN`/`END` sessions with context loading
- 3-tier priority loops: HIGH > MED > BACKLOG
- `#decision` tagging with promotion to MEMORY.md
- Session templates: `BEGIN` (standard) and `BEGIN quick`
- GitHub backup auto-enabled (every END)
- Stale loop handling
- Unclosed session detection
- 1% Better prompt (every 5 sessions)
- Witness Protocol + Emotion Check (optional hooks)

## Memory Structure
```
memory/
├── daily/              # Session handoffs (YYYY-MM-DD.md)
├── loops.md             # Open loops
├── backups/            # GitHub backup copies
├── .session-active    # Session marker
├── .session-count     # Session counter
└── .timezone          # Timezone

MEMORY.md               # Long-term memory
references/
└── focus-best-practices.md  # Your preferences
```

## Setup
Just say `BEGIN` — the 10-question wizard runs automatically.

## Usage
```
BEGIN              # Standard session
BEGIN quick        # Short session

[work — tag decisions with #decision]

END                # Full handoff + GitHub backup + #decision promotion
```

## Best For
- Most users
- Multi-project work
- Daily professional use
- GitHub-backed memory workflow