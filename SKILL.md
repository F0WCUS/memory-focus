---
name: memory-focus
description: "Unified memory framework for HeyRon agents: FOCUS sessions with priority loops, structured handoffs, long-term memory cycling via sync/study, continuous improvement via 1% Better, and emotional awareness via Witness Protocol. Use when user says BEGIN, END, R:, sync, study, or wants to work with focus and memory."
license: MIT
metadata:
  author: "Synthesized from MEMORY-FLOW (Reb-Elle-Art) + Stuart + Thad-FoWCuS — Todd (OpenClaw)"
  version: "1.0"
  synthesis: "mf-st-thad-v1"
  triggers:
    - BEGIN
    - END
    - R:
    - RB:
    - sync
    - sync now
    - study
    - mega sync
    - 1% better
  category: memory
  requires:
    - filesystem
    - memory_search
---

# memory-focus — Unified Memory Framework for HeyRon Agents

**Focus. Memory. Continuous Improvement.**

memory-focus is a complete, layered memory system for HeyRon/OpenClaw agents. It combines structured focus FOCUS sessions persistent long-term memory cycling, and a lightweight continuous-improvement loop into one seamless experience.

Built from three proven systems — MEMORY-FLOW, Stuart, and Thad-FoWCuS — synthesized through the mf-st-thad-v1 process.

---

## The Three Layers

memory-focus operates on three memory layers that work together:

| Layer | Skill | Handles |
|-------|-------|---------|
| **Session** | memory-flow | Real-time context: what we're working on, open loops, FOCUS handoffs |
| **Long-term** | sync / study | Persistent memory across FOCUS sessions saves, loads, GitHub backup |
| **Growth** | Thad patterns | 1% Better (on by default — opt out in setup), Witness Protocol, Emotion Check |

The result: **minimal context loss, persistent memory between logins, seamless session continuity.**

---

## Quick Start

### First Time

```
BEGIN
```

The 10-question setup wizard runs automatically. Takes ~5 minutes.

### Daily Use

```
BEGIN              # Start a standard focus session

[work — tag decisions with #decision as you go]

END                # End FOCUS, write handoff, promote decisions, GitHub backup
```

### Long-Term Memory

```
sync               # Save to long-term memory + push to GitHub
study              # Load memories — catch up instantly
mega sync          # Full system health check
```

---

## Core Triggers

| Trigger | Skill | Action |
|---------|-------|--------|
| `BEGIN` | memory-flow | Start standard session: load loops, MEMORY.md, last 3 dailies |
| `END` | memory-flow | End FOCUS: handoff, decision promotion, GitHub backup |
| `R: thing` | memory-flow | Add open loop (MED priority) |
| `R!: thing` | memory-flow | Add high-priority loop |
| `RB: thing` | memory-flow | Add someday/backlog loop |
| `sync` | sync | Save memory files + push to GitHub |
| `sync now` | sync | Force save and push immediately |
| `study` | study | Load all memories, catch up |
| `mega sync` | mega-sync | Full system health check |
| `1% better` | memory-flow | Manual trigger for improvement prompt |

---

## Memory Structure

```
memory/
├── daily/                    # Session handoffs (YYYY-MM-DD.md)
├── loops.md                 # Open loop registry
├── backups/                  # GitHub backup copies
├── .focus-active          # Marker: session in progress
├── .focus-count           # Session counter (for 1% Better)
└── .timezone               # User's timezone

MEMORY.md                    # Long-term memory: key decisions, context

references/
└── focus-best-practices.md   # Your preferences (filled by wizard)

projects/
└── [name]/
    └── session-links.md     # File changes linked to projects
```

---

## How It All Connects

```
BEGIN
  → Load: loops, MEMORY.md, last 3 dailies, preferences
  → Warn if unclosed session (marker + timestamp)
  → Report: loop count, stale loops, recent handoffs
  → "What are we focusing on?"

DURING SESSION
  → Track progress, tag #decision inline
  → Add incomplete items to loops.md with #in-session
  → Optional: Witness Protocol / Emotion Check hooks

END
  → Verify incomplete work → move to handoff
  → Check stale loops (>7 days) → keep/mark/archive
  → Detect #decision tags → promote to MEMORY.md
  → Write structured handoff to memory/daily/
  → Link files to project spokes
  → GitHub backup (auto by default)
  → 1% Better prompt (every 5 FOCUS sessions)
  → Delete .focus-active marker

sync
  → Save memory files to long-term storage
  → Push to GitHub
  → Tag suggestions + auto-suggest

study
  → Load last 7 days of memories
  → Filter by tag
  → Cross-reference decisions
  → Present summary
```

---

## Priority Loops

memory-focus uses a **3-tier priority system** (customizable in wizard):

| Syntax | Tag | Meaning |
|--------|-----|---------|
| `R!: thing` | #priority-high | Do today |
| `R: thing` | MED (default) | Do this week |
| `RB: thing` | #backlog | Someday / when available |

**Soft limit:** Warn at 10 open loops. No hard enforcement — you decide when to prune.

**Stale policy:** Loops older than 7 days flagged at BEGIN. At END, choose: Keep / Mark Complete / Archive.

---

## Decision Workflow

Tag decisions with `#decision` during FOCUS sessions

```
We decided to use the 3-tier system #decision
```

At END, the agent:
1. Scans session notes for `#decision` tags
2. Prompts: "Found N decisions. Promote to MEMORY.md?"
3. If yes: adds each to `MEMORY.md` with date + source link

`sync` then backs the long-term memory to GitHub. `study` loads it for next session.

---

## 1% Better

Every 5 sessions (configurable), at END:

> "1% Better: What's one thing you learned, improved, or want to do differently next session?"

Saved to today's daily under **Session Improvements**. Simple, consistent, compounding.

---

## Optional Hooks

Enabled via setup wizard (or edited in `references/focus-best-practices.md`):

**Witness Protocol** — During session, if something feels significant:
> "This seems like a moment — [acknowledgment]. Should I note it?"

**Emotion Check** — During session, if tone or topic shifts noticeably:
> "This seems to be landing differently for you — want to note it?"

Both are lightweight, optional awareness prompts. Not intrusive. Fully under your control.

---

## GitHub Backup

**Auto by default — every END pushes a backup to GitHub.** Every `END` runs `scripts/github-backup.sh` automatically.
**Opt-in mode:** Create `memory/.github-backup-auto` to disable auto; backup only if marker exists.

Set your preference in the wizard.

---

## Session Templates

| Command | Duration | Behavior |
|---------|----------|----------|
| `BEGIN` | ~1 hr | Full flow: context load + full handoff |

Custom templates can be configured in the wizard.

---

## Context Efficiency

Sessions load only what's needed. Target: **< 5KB per typical session.**

| Session Type | Files Loaded |
|-------------|--------------|
| Short (<1 hr) | loops.md + timezone check |
| Standard (1-2 hr) | loops.md + MEMORY.md + last 3 dailies |
| Long (2+ hr) or after break | Everything (full load) |

---

## OpenClaw HEARTBEAT

memory-focus includes a heartbeat configuration for automatic background tasks:

- Session start reminders
- Memory rules (write after important conversations, check before answering)
- 1% Better tracking
- Witness Protocol and Emotion Check (if enabled)
- Post-session write

See `HEARTBEAT.md` in this repo for full configuration.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "No daily log found" | Say `BEGIN` — creates today's log automatically |
| "Loops not loading" | Check `memory/loops.md` exists |
| FOCUS marker stuck | Delete `memory/.focus-active` |
| Stale loops piling up | At BEGIN, prompt to keep/mark complete/archive |
| 1% Better not triggering | Check `memory/.focus-count` exists; fires every 5 FOCUS sessions |
| No timezone set | Ask at first BEGIN, written to `memory/.timezone` |
| Loops at 10+ | Warn but don't enforce — you override |
| `sync` fails | Check GitHub remote; retry with `sync now` |
| `study` empty | Run `sync` first to populate memories |

---


```
memory-focus/
├── SKILL.md                     # This file
├── HEARTBEAT.md                # OpenClaw heartbeat config
├── README.md                    # Entry point
├── ROOT_SIGNPOSTS.md           # Root-level skill index
├── skills_catalog.yaml         # Machine-readable catalog
├── skills/
│   ├── memory-flow/SKILL.md  # Focus sessions (BEGIN/END, loops)
│   ├── sync/SKILL.md           # Save to long-term memory + GitHub
│   ├── study/SKILL.md          # Load memories, catch up
│   └── mega-sync/SKILL.md     # Full system health check
├── setup/
│   └── memory-focus-setup.md.md  # 10-question wizard
├── references/
│   └── focus-best-practices.md  # Your preferences
├── templates/
│   ├── daily-log-template.md   # Session handoff format
│   ├── loops-template.md       # Open loop registry format
│   └── MEMORY.md-template.md   # Long-term memory structure
└── scripts/
    ├── bootstrap-memory.sh     # Create memory/ directory
    ├── prune-loops.sh           # Soft warn at 10 loops
    ├── stale-loop-checker.sh    # Flag 7+ day loops
    └── github-backup.sh        # GitHub handoff backup
```

---

## Tags Reference

| Tag | Meaning |
|-----|---------|
| `#decision` | A decision made (promote to MEMORY.md at END) |
| `#open-loop` | Something to revisit |
| `#in-session` | Started but not finishing this session |
| `#priority-high` | Do today |
| `#backlog` | Someday / when available |
| `#urgent` | Alternative for #priority-high if preferred |

---

## Synthesis Notes

memory-focus was built through the **mf-st-thad-v1 synthesis process**, combining three source repos:

- **MEMORY-FLOW** (Reb-Elle-Art) — Session system with priority loops, structured handoffs, decision promotion, setup wizard
- **Stuart** — Long-term memory cycling: sync/study/mega-sync with GitHub backup and tag auto-suggestion
- **Thad-FoWCuS** — 1% Better rule, Witness Protocol, Emotion Check, HEARTBEAT configuration, agent personality

13 human decisions were made at the decision gate (Step 4 of the synthesis process), applied to produce this unified framework.

---

*memory-focus — mf-st-thad-v1 | Built: 2026-05-02*
*Synthesized from: MEMORY-FLOW + Stuart + Thad-FoWCuS*
*Decision log: available on request*