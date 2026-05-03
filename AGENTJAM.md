# memory-focus

*A complete memory system for HeyRon agents. Three-layer framework: structured focus sessions (FOCUS), persistent long-term memory cycling, and a continuous-improvement loop — so every session picks up exactly where the last one left off.*

---

## What It Does

memory-focus solves the "where did we leave off?" problem that breaks agent productivity across sessions. It gives agents:

- **FOCUS sessions** — Structured BEGIN/END workflow with open-loop tracking, priority queues, and decision tagging (`#decision`)
- **Long-term memory** — `sync`/`study` cycling backed to GitHub, so context survives across logins and project handoffs
- **1% Better** — Every 5 FOCUS sessions, the agent asks what one thing could improve. Small, consistent, compounding growth

Two awareness hooks (Witness Protocol, Emotion Check) are on by default and help the agent notice when something matters to the human — not just when it's explicitly tasked.

---

## Why This Should Win

memory-focus is the first memory framework that genuinely works *across* sessions without requiring the human to re-explain everything every login. It's the difference between an agent that forgets everything and one that builds on previous work.

The three-layer design (FOCUS → sync/study → 1% Better) covers the full memory lifecycle: what you're doing now, what you decided before, and what you can do better. Other skills optimize one layer. memory-focus ties all three together.

It's also the first to use `#decision` as a first-class tagging primitive — making decisions *findable* and *searchable* long after the conversation that produced them.

---

## How to Install

### Prerequisites

- HeyRon container (OpenClaw compatible)
- GitHub account (for backup sync — required for auto-backup feature)
- 5 minutes for the setup wizard on first use

### Steps

1. Clone this repo into your HeyRon workspace:
   ```bash
   git clone https://github.com/F0WCUS/memory-focus.git
   ```
2. Navigate to the skill directory:
   ```bash
   cd memory-focus
   ```
3. Say `BEGIN` to start your first FOCUS — the setup wizard runs automatically

---

## Example

### Input
```
BEGIN
```

### Output
```
[Agent loads: 3 open loops, 2 decisions from last FOCUS, last 3 daily logs]
[.focus-active marker created]

⚡ FOCUS started — 2026-05-02 23:45 UTC
📋 Open loops: 3 items (1 HIGH priority)
🗓️ Recent: Last FOCUS was 2 days ago on project X

What are we focusing on today?
```

---

### Input
```
R!: Fix the login bug
R: Review pull requests
RB: Refactor auth module
We decided to use JWT for auth #decision
END
```

### Output
```
✅ FOCUS ended — 2026-05-02 23:58 UTC

📋 Decisions promoted to MEMORY.md:
  • "We decided to use JWT for auth"

📁 Handoff written to: memory/daily/2026-05-02.md
🔄 GitHub backup pushed

💡 1% Better: What one thing could be better next FOCUS?
[Response saved to session improvements]
```

---

## Demo

See the `/demo` folder for:
- FOCUS workflow demo (BEGIN → work → END cycle)
- sync/study long-term memory demo
- Priority loop management

---

## Technical Notes

### Files

| File | Purpose |
|------|---------|
| `SKILL.md` | Main skill — all triggers, protocols, memory structure |
| `skills/memory-flow/SKILL.md` | BEGIN/END protocol, loop registry, decision promotion |
| `skills/sync/SKILL.md` | Save to memory + GitHub backup |
| `skills/study/SKILL.md` | Load memories, catch up |
| `skills/mega-sync/SKILL.md` | System health check |
| `HEARTBEAT.md` | OpenClaw background task configuration |
| `setup/memory-focus-setup.md` | 10-question setup wizard |

### Dependencies

- OpenClaw filesystem tools
- `memory_search` capability
- GitHub CLI or HTTPS remote (for backup sync)

### openclaw.json changes

None required. memory-focus reads and writes files within its own directory structure. No global config modifications.

---

## License

MIT

---

*Submitted by @FoWCUS* | *v1.0*