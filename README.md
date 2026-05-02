# F0WCUS — Unified Memory Framework for HeyRon Agents

**Focus. Memory. Continuous Improvement.**

F0WCUS is a complete, layered memory system for HeyRon/OpenClaw agents. It combines structured focus sessions, persistent long-term memory cycling, and a continuous-improvement loop into one seamless experience.

Built from three proven systems — MEMORY-FLOW, Stuart, and Thad-FoWCuS — synthesized through the mf-st-thad-v1 process.

---

## What It Does

F0WCUS operates on three memory layers that work together:

| Layer | Skill | Handles |
|-------|-------|---------|
| **Session** | memory-flow | Real-time context: open loops, session handoffs, decisions |
| **Long-term** | sync / study | Persistent memory: saves, loads, GitHub backup |
| **Growth** | Thad patterns | 1% Better, Witness Protocol, Emotion Check |

**Goal:** Minimal context loss, persistent memory between logins, seamless session continuity.

---

## Quick Start

### First Time

```
BEGIN
```

The 10-question setup wizard runs automatically (~5 minutes).

### Daily Use

```
BEGIN              # Standard session
BEGIN quick        # Short session

[work — tag decisions with #decision]

END                # Handoff + decisions promoted + GitHub backup
```

### Long-Term Memory

```
sync               # Save + push to GitHub
study              # Load memories, catch up
mega sync          # Full health check
```

---

## Core Triggers

| Trigger | Action |
|---------|--------|
| `BEGIN` | Start session: load loops, MEMORY.md, last 3 dailies |
| `BEGIN quick` | Short session, abbreviated handoff |
| `END` | End session, write handoff, promote decisions |
| `REMIND ME: thing` | Add open loop (MED priority) |
| `REMIND ME (HIGH): thing` | Add high-priority loop |
| `REMIND ME (BACKLOG): thing` | Add someday/backlog loop |
| `sync` | Save memory + push to GitHub |
| `study` | Load memories, catch up |
| `mega sync` | Full system health check |
| `1% better` | Manual improvement prompt |

---

## How MEMORY-FLOW Complements Stuart

**Stuart** = `sync` / `study` cycle for long-term memory.
- **sync** — Save conversations to memory with tags, push to GitHub
- **study** — Load memories, catch up, get context
- **mega sync** — Full system health check

**MEMORY-FLOW** = session-level focus and handoff.
- **BEGIN** — Load context: loops, MEMORY.md, last 3 dailies, preferences
- **During** — Track progress, tag decisions, log incomplete items
- **END** — Structured handoff, decision promotion, project linking

**Together they cover:**
- Session-to-session continuity (MEMORY-FLOW)
- Long-term memory and cross-session learning (Stuart)
- Persistent, searchable memory system (both)

---

## Recipes

| Recipe | Who it's for |
|--------|-------------|
| `minimal/` | Casual users, single-project, minimal overhead |
| `standard/` | **Recommended.** Full framework, auto GitHub backup |
| `complete/` | Power users, all hooks enabled |

---

## Project Structure

```
F0WCUS/
├── SKILL.md                     # Main skill (this file)
├── HEARTBEAT.md               # OpenClaw heartbeat config
├── README.md                   # This file
├── ROOT_SIGNPOSTS.md          # Root-level skill index
├── skills_catalog.yaml       # Machine-readable catalog
├── skills/
│   ├── memory-flow/SKILL.md   # Focus sessions (BEGIN/END, loops)
│   ├── sync/SKILL.md          # Save to long-term memory + GitHub
│   ├── study/SKILL.md         # Load memories, catch up
│   └── mega-sync/SKILL.md     # Full system health check
├── setup/
│   └── MEMORY-FLOWCUS-Setup.md  # 10-question wizard
├── references/
│   └── focus-best-practices.md  # Your session preferences
├── templates/
│   ├── daily-log-template.md   # Handoff format
│   ├── loops-template.md       # Open loop registry format
│   └── MEMORY.md-template.md   # Long-term memory structure
└── scripts/
    ├── bootstrap-memory.sh    # Create memory/ directory
    ├── prune-loops.sh          # Soft warn at 10 loops
    ├── stale-loop-checker.sh   # Flag 7+ day loops
    └── github-backup.sh       # GitHub handoff backup
```

---

## Memory Files

| File | Purpose |
|------|---------|
| `memory/daily/YYYY-MM-DD.md` | Session handoffs |
| `memory/loops.md` | Open loop registry |
| `memory/.session-active` | In-progress marker (created on BEGIN, deleted on END) |
| `memory/.session-count` | Session counter (for 1% Better) |
| `memory/.timezone` | Your timezone |
| `MEMORY.md` | Long-term memory (decisions, context) |

---

## Customization

Edit `references/focus-best-practices.md` to change:
- Custom tags beyond defaults
- Priority level names (HIGH/MED/BACKLOG default)
- Session preferences
- File placement conventions
- GitHub backup mode
- 1% Better interval
- Witness Protocol on/off
- Emotion Check on/off

---

## Synthesis

**mf-st-thad-v1** — Built from three source repos:
- **MEMORY-FLOW** (Reb-Elle-Art) — Session system with priority loops
- **Stuart** (F0WCUS) — Long-term memory cycling: sync/study/mega-sync
- **Thad-FoWCuS** — 1% Better, Witness Protocol, Emotion Check, HEARTBEAT

13 human decisions made at the synthesis decision gate.

*F0WCUS v1.0 | Built: 2026-05-02*