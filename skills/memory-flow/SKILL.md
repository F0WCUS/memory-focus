---
name: memory-flow
description: "Structured focus FOCUSs with priority loops, structured handoffs, and #decision promotion. Use when user initiates a focus FOCUS with BEGIN, ends one with END, or adds a reminder with R:."
license: MIT
metadata:
  author: Reb-Elle-Art (base); Todd (synthesis for mf-st-thad-v1)
  version: "1.0"
  src: "mf-st-thad-v1 synthesis"
  triggers:
    - BEGIN
    - END
    - R:
    - R!:
    - RB:
  category: memory/FOCUS
  requires:
    - filesystem
    - memory_search
---

# MEMORY-FLOW — Unified Focus FOCUSs with Memory Logging

**Part of memory-focus unified memory framework (mf-st-thad-v1)**

## Triggers

| Trigger | Action |
|---------|--------|
| `BEGIN` | Start a standard focus FOCUS |
| `END` | End FOCUS, write handoff, promote decisions |
| `R: X` | Add open loop (MED priority) |
| `R!: X` | Add high priority open loop |
| `RB: X` | Add backlog item |
| `1% better` | Manual trigger for improvement prompt |

---

## Memory Structure

```
memory/
├── daily/                    # FOCUS handoffs (YYYY-MM-DD.md)
├── loops.md                  # Open loops (warn at 10, no hard limit)
├── backups/                  # GitHub backup copies
├── .focus-active           # Marker: FOCUS in progress
├── .focus-count           # FOCUS counter (for 1% Better)
├── .timezone               # User's timezone
└── .github-backup-auto     # (only if auto backup enabled)

MEMORY.md                    # Long-term memory (decisions, context)

references/
└── focus-best-practices.md  # User preferences (from setup wizard)
```

---

## Why Context Efficiency Matters

At each BEGIN, load only what's needed. Extra files waste tokens and slow startup.

| FOCUS Type | Duration | Files Loaded |
|-------------|----------|--------------|
| Short | <1 hr | loops.md + timezone check |
| Standard | 1-2 hr | loops.md + MEMORY.md + last 3 dailies |
| Long | 2+ hr | Everything (full load) |

Target: < 5KB per typical FOCUS.

---

## BEGIN Protocol (8 Steps)

### Step 0: Check for Setup

First time? Run the 10-question wizard:
```
BEGIN
```
Answer all questions. They're saved to `references/focus-best-practices.md`.

### Step 1: Create or Load Today's Daily Log

Check if `memory/daily/YYYY-MM-DD.md` exists. If not, create:

```markdown
---
type: focus-log
date: YYYY-MM-DD
focusFOCUSs: []
---
```

### Step 2: Check for Unclosed FOCUSs

**Two-pronged check:**

a) Marker check: Does `memory/.focus-active` exist?
   → If yes: "There's an unclosed FOCUS marker. Did you forget to END?"

b) Time check: Parse today's daily for FOCUS starts without matching END (>4 hours old)
   → If found: "You started a FOCUS X hours ago without closing it. Want to END first?"

Always warn. Let the user decide.

If no unclosed FOCUS: write `memory/.focus-active` with timestamp.

### Step 3: Check Timezone

If `memory/.timezone` doesn't exist:
> "What timezone for daily logs? (e.g., UTC, America/New_York)"

Write answer to `memory/.timezone`.

### Step 4: Load Open Loops

Read `memory/loops.md`:
- Sort by priority: HIGH > MED > BACKLOG
- Flag loops older than 7 days as "stale"
- Count and report: "You have N open items (N HIGH priority)"

**Soft limit:** If 10+ loops, warn: "You've reached 10 open loops. Consider pruning."

### Step 5: Load Long-Term Memory (MEMORY.md)

Read `MEMORY.md` for key decisions and context.

### Step 6: Load Recent Handoffs (Last 3 Dailies)

Find 3 most recent daily files. Read in reverse chronological order.
Extract: active projects, open questions, files being worked on.

### Step 7: Load FOCUS Preferences (Best Practices)

Read `references/focus-best-practices.md` if it exists.
Apply any custom tags, file conventions, or preferences.

### Step 8: Acknowledge FOCUS Start

Report to user:
- Timestamp
- Open loop count (by priority)
- Stale loop count (flag for user)
- Quick summary of recent handoffs
- "What are we focusing on today?"

---

## During FOCUS

- Track active context: project name, files being worked on
- Tag decisions with `#decision` as they happen
- When something won't complete: add to `loops.md`
- Log progress to today's daily as you go
- Keep notes lean — write enough to remember, not a transcript

**Optional hooks (from decisions 7+8):**

- **Witness Protocol** (if enabled): If something feels significant, acknowledge:
  > "This seems like a moment — [brief acknowledgment]. Should I note it?"

- **Emotion Check** (if enabled): If noticeable shift in tone/topic:
  > "This seems to be landing differently for you — want to note it?"

---

## END Protocol (7 Steps)

### Step 1: Verify Incomplete Work

Check `loops.md` for `#in-FOCUS` items:
- If found: move each to today's handoff as "Incomplete"
- If none: proceed

### Step 2: Check for Stale Loops

Check for loops older than 7 days:
> "You have N stale loops. Keep, mark complete, or archive?"

Process user's response.

### Step 3: Detect Decisions

Scan FOCUS notes for `#decision` tags:
> "Found N decisions. Promote to MEMORY.md?"

If yes: add each to `MEMORY.md` with date and source file reference.

### Step 4: Write Structured Handoff

Write to today's daily:

```markdown
## FOCUS — HH:MM:SS

Context: What we worked on, why

Work Done:
- Item 1
- Item 2

Decisions:
- #decision Description

Files Modified:
- /full/path/file1
- /full/path/file2

Incomplete (moved to loops):
- Item that didn't finish #in-FOCUS

Next Steps:
- What needs doing next

END — HH:MM:SS
```

### Step 5: Link Files to Projects

Parse "Files Modified":
- For each file, detect if it belongs to `projects/[name]/`
- If project has `FOCUS-links.md`: append this FOCUS's entry
- If not in a project: note in `MEMORY.md` under "Infrastructure Changes"

### Step 6: Cleanup

Delete `memory/.focus-active` marker file.

**GitHub backup (if auto-enabled):**
Run `scripts/github-backup.sh` automatically.

### Step 7: 1% Better Check

Increment `memory/.focus-count`.
If count % 5 == 0:
> "1% Better: What's one thing you learned, improved, or want to do differently next FOCUS?"

Save response to today's daily under "FOCUS Improvements."
Reset or continue counter.

### Step 8: Confirm

Tell the user the handoff file path.

---

## Open Loop Registry

### loops.md Structure

```markdown
- [ ] Reminder text #open-loop #YYYY-MM-DD
- [ ] High priority item #priority-high #YYYY-MM-DD
- [ ] Couch mouse-proofing #backlog #open-loop #2026-05-09
```

### Priority Levels (Decision 1: 3-Tier Hybrid)

| Syntax | Tag | Meaning |
|--------|-----|---------|
| `R: thing` | MED | Regular open loop (default) |
| `R!: thing` | #priority-high | Do today |
| `RB: thing` | #backlog | Someday / when available |

**Soft limit:** Warn at 10 items. No hard enforcement.

**Stale = 7+ days.** Flag at BEGIN, resolve at END.

---

## Decision Tagging (Decision 2: #decision)

Tag decisions with `#decision` inline during FOCUS:

```markdown
- We decided to use the 3-tier hybrid system #decision
```

At END, scan for `#decision` tags. Prompt to promote to `MEMORY.md`.

---

## FOCUS Templates (Decision 11)

| Template | Command | Behavior |
|----------|---------|----------|
| Standard | `BEGIN` | Full BEGIN/END flow |

Custom templates (from wizard decision 10) can be added to `references/focus-best-practices.md`.

---

## GitHub Backup (Decision 5: Configurable)

**Auto mode (default):** Every END runs `scripts/github-backup.sh` automatically.
**Opt-in mode:** Only if `memory/.github-backup-auto` exists.

Configure in wizard: "auto (Stuart style)" vs "opt-in (MEMORY-FLOW style)"

---

## Context Injection Summary

Target: < 5KB per typical FOCUS.

| FOCUS Type | Files Loaded |
|-------------|--------------|
| Short (<1hr) | loops.md + timezone check |
| Standard (1-2hr) | loops.md + MEMORY.md + last 3 dailies |
| Long (2hr+) | Everything (full load) |

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "No daily log found" | Say BEGIN — creates today's log automatically |
| "Loops not loading" | Check `memory/loops.md` exists or is empty |
| FOCUS marker stuck | Delete `memory/.focus-active` manually |
| Stale loops piling up | At BEGIN, prompt to keep/mark complete/archive |
| 1% Better not triggering | Check `memory/.focus-count` exists |
| No timezone set | Ask user at first BEGIN, write to `memory/.timezone` |
| Loops at 10+ | Warn but don't enforce — user can override |

---

*Part of memory-focus — mf-st-thad-v1*
*Built from: MEMORY-FLOW + Stuart + Thad-FoWCuS*
*Decision log: testdocs/synthesis-mf-st-thad-v1/decisions.md*