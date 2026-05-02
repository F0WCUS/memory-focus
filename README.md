# memory-focus — Unified Memory Framework for HeyRon Agents

**Focus. Remember. Improve.**

> **Note:** Focused work sessions are called a **FOCUS** throughout this framework — not a "session." FOCUS refers specifically to the period between `BEGIN` and `END`.

memory-focus is a complete memory system for HeyRon/OpenClaw agents. It gives agents structured focus sessions, persistent long-term memory, and a lightweight improvement loop — so every FOCUS picks up exactly where the last one left off.

---

## What It Does

**FOCUS layer** — Start a FOCUS with `BEGIN`, track your work, tag decisions with `#decision`, and end with a structured handoff that the next FOCUS can immediately load.

**Long-term layer** — Save memories with `sync`, load them back with `study`, and back them up to GitHub automatically.

**Growth layer** — Every 5 FOCUS sessions, the agent asks: "What one thing could be better?" Small, consistent, compounding. **On by default** — opt out during setup if you don't want it.

Two optional awareness hooks are also included: **Witness Protocol** and **Emotion Check**. Both are **on by default** — opt out during setup if you don't want them.

---

## Core Commands

```
BEGIN              Start a FOCUS
[work]
END                End FOCUS: handoff + decision promotion + GitHub backup

R: thing           Add open loop (medium priority)
R!: thing          Add high-priority loop (do today)
RB: thing          Add backlog item (someday)

sync               Save to long-term memory + push to GitHub
sync now           Force save immediately
study              Load memories, catch up instantly
mega sync          Full system health check
1% better          Manual trigger for improvement prompt
```

---

## Priority System

Three tiers. Soft limit at 10 open loops — the agent warns but doesn't enforce.

| Command | Priority | Tag | Meaning |
|---------|----------|-----|---------|
| `R!: couch` | HIGH | #priority-high | Do today |
| `R: email` | MED | (default) | Do this week |
| `RB: old-project` | BACKLOG | #backlog | Someday |

---

## How a FOCUS Works

**BEGIN**
→ Loads open loops, recent handoffs, key decisions from MEMORY.md, and your preferences
→ Warns if a previous FOCUS was left unclosed
→ Asks: "What are we focusing on?"

**During**
→ Tag decisions inline: `We decided to use X #decision`
→ Incomplete work gets moved to loops.md automatically
→ Optional: Witness Protocol and Emotion Check awareness hooks (on by default)

**END**
→ Verifies incomplete work
→ Promotes `#decision` tags to MEMORY.md
→ Writes structured handoff to today's daily log
→ GitHub backup (auto by default)
→ 1% Better prompt (every 5 FOCUS sessions)

---

## Long-Term Memory

```
sync    → Saves to memory files + GitHub
study   → Loads last 7 days + long-term decisions, presents summary
```

Key decisions are tagged `#decision` during a FOCUS and promoted to `MEMORY.md` at END. They survive across FOCUS sessions, project handoffs, and breaks.

---

## GitHub Backup

Auto by default — every END pushes a backup copy to GitHub.

Requires GitHub to be set up. If you don't have GitHub or don't want backups, say **no** during setup and auto-backup will be disabled.

---

## Setup

First time you say `BEGIN`, a setup wizard runs automatically. Covers:
- GitHub backup preference
- 1% Better (on by default — say no to disable)
- Witness Protocol (on by default — say no to disable)
- Emotion Check (on by default — say no to disable)

---

## What's in memory-focus

```
memory-focus/
├── SKILL.md                     # Main skill
├── HEARTBEAT.md               # Background config
├── README.md                   # You are here
├── ROOT_SIGNPOSTS.md          # Skill index
├── skills_catalog.yaml        # Machine-readable catalog
├── skills/
│   ├── memory-flow/          # BEGIN/END, loops
│   ├── sync/                  # Long-term save
│   ├── study/                 # Long-term load
│   └── mega-sync/            # Health check
├── setup/
│   └── memory-focus-setup.md  # Setup wizard
├── references/
│   └── focus-best-practices.md  # Your preferences
├── templates/
│   ├── daily-log-template.md   # FOCUS handoff format
│   ├── loops-template.md       # Open loop registry format
│   └── MEMORY.md-template.md   # Long-term memory structure
└── scripts/
    ├── bootstrap-memory.sh    # Create memory/ directory
    ├── prune-loops.sh          # Soft warn at 10 loops
    ├── stale-loop-checker.sh   # Flag 7+ day loops
    └── github-backup.sh       # GitHub handoff backup
```

---

## Tags Reference

| Tag | Meaning |
|-----|---------|
| `#decision` | A decision (promoted to MEMORY.md at END) |
| `#open-loop` | Something to revisit |
| `#in-session` | Started but not finishing this FOCUS |
| `#priority-high` | Do today |
| `#backlog` | Someday |
| `#urgent` | Alternative for #priority-high |

---

*memory-focus v1.0 | MIT License*