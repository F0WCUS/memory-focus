---
name: cookbook-complete
description: "Full F0WCUS system: everything enabled, all hooks active, GitHub backup auto, project file linking, and custom session templates."
license: MIT
metadata:
  author: Todd (mf-st-thad-v1 synthesis)
  version: "1.0"
  triggers:
    - cookbook complete
  category: memory/recipe
---

# Complete Recipe — F0WCUS Full System

**Everything enabled. Maximum memory, maximum persistence.**

## What's Included
- Everything in Standard recipe, plus:
- All optional hooks fully enabled (1% Better, Witness Protocol, Emotion Check)
- Custom session templates (if configured in wizard)
- GitHub backup auto (Stuart-style)
- Project file linking every END

## Memory Structure
```
memory/
├── daily/              # Session handoffs
├── loops.md            # Open loops (warn at 10)
├── backups/           # GitHub backup copies
├── .session-active    # Session marker
├── .session-count     # Session counter (for 1% Better)
└── .timezone         # Timezone

MEMORY.md               # Long-term memory with #decision promotion

references/
└── focus-best-practices.md  # Full preferences (all hooks enabled)

projects/
└── [name]/
    └── session-links.md    # File change history per project
```

## Setup

Enable GitHub backup auto:
```
touch memory/.github-backup-auto
```

Run wizard:
```
BEGIN
```

Configure all options (1% Better, Witness Protocol, Emotion Check all enabled).

## Usage
```
BEGIN              # Standard session
BEGIN quick        # Short session

[work — use #decision for all decisions]

END                # Full handoff + GitHub backup + #decision promotion
                   # + 1% Better prompt (every 5 sessions)
                   # + Witness/Emotion Check hooks active
```

## Best For
- Power users
- Multi-project environments
- Team collaboration (via GitHub handoff sharing)
- Users who want the full system with all optional hooks