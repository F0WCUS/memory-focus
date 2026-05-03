# memory-focus
## Unified Memory Framework for HeyRon Agents 

*A complete memory system for HeyRon agents. Three-layer framework: structured focus sessions (FOCUS), persistent long-term memory cycling, and a continuous-improvement loop — so every session picks up exactly where the last one left off.*

---

## What It Does

memory-focus solves the "where did we leave off?" problem that breaks agent productivity across sessions. It gives agents:

- **FOCUS sessions** — Structured BEGIN/END workflow with open-loop tracking, priority queues, and decision tagging (`#decision`)
- **Long-term memory** — `sync`/`study` cycling backed to GitHub, so context survives across logins and project handoffs
- **1% Better** — Every 5 FOCUS sessions, the agent asks what one thing could improve. Small, consistent, compounding growth

Two awareness hooks (Witness Protocol, Emotion Check) are on by default and help the agent notice when something matters to the human — not just when it's explicitly tasked.

> **Note:** Focused work sessions are called a **FOCUS** throughout this framework — not a "session." FOCUS refers specifically to the period between `BEGIN` and `END`.

---

## Why This Should Win

memory-focus is the first memory framework that genuinely works *across* sessions without requiring the human to re-explain everything every login. It's the difference between an agent that forgets everything and one that builds on previous work.

The three-layer design (FOCUS → sync/study → 1% Better) covers the full memory lifecycle: what you're doing now, what you decided before, and what you can do better. Other skills optimize one layer. memory-focus ties all three together.

It's also the first to use `#decision` as a first-class tagging primitive — making decisions *findable* and *searchable* long after the conversation that produced them.

---

## How to Install

### Prerequisites

- HeyRon container (OpenClaw compatible)
- GitHub account (for backup sync — only required when using auto-backup feature)
- 5 minutes for the setup wizard on first use

### Steps
#### What to ask your agent:

1. <Your Agent's Name>, please clone this repo into your HeyRon workspace: https://github.com/F0WCUS/memory-focus.git
   
2. <Your Agent's Name>, please review README.md, SKILL.md, and skills/

3. **Start a FOCUS** Say `BEGIN` to start your first FOCUS — the setup wizard runs automatically

---
## Setup

First time you say `BEGIN`, a setup wizard runs automatically. Covers:
- GitHub backup preference
- 1% Better (on by default — say no to disable)
- Witness Protocol (on by default — say no to disable)
- Emotion Check (on by default — say no to disable)

---
## Core Commands

```
BEGIN              Start a FOCUS (load context)
    [then you work]
END                End FOCUS: handoff + decision promotion + GitHub backup

R: *thing*           Add open loop (medium priority)
R!: *thing*          Add high-priority loop (do today)
RB: *thing*          Add backlog item (someday)

sync               Save to long-term memory + push to GitHub
sync now           Force save immediately
study              Load memories, catch up instantly
mega sync          Full system health check
1% better          Manual trigger for improvement prompt
```


---

## How a FOCUS Works

**BEGIN**
→ Loads open loops, recent handoffs, key decisions from MEMORY.md, and your preferences
→ Warns if a previous FOCUS was left unclosed
→ Asks: "What are we focusing on?"

**During**
→ Tag decisions inline: `We decided to use X #decision`
→ Incomplete work gets moved to loops.md automatically
→ Witness Protocol and Emotion Check awareness hooks (on by default) check for the *implicit*

**END**
→ Verifies complete/incomplete work
→ Promotes `#decision` tags to MEMORY.md
→ Writes structured handoff to today's daily log
→ GitHub backup (auto by default)
→ 1% Better prompt (every 5 FOCUS sessions)

---
## How Long-Term Memory Works

```
sync    → Saves to memory files + GitHub
study   → Loads last 7 days + long-term decisions, presents summary
```

Key decisions are tagged `#decision` during a FOCUS and promoted to `MEMORY.md` at END. They survive across FOCUS sessions, project handoffs, and breaks.

### GitHub Backup

Auto by default — every END pushes a backup copy to GitHub.

Requires GitHub to be set up. If you don't have GitHub or don't want backups, say **no** during setup and auto-backup will be disabled.

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
R!: Fix my backup workflow- it didn't run yesterday
R: Set up appify account
RB: Clean up files in the worksapce :(

### Output
```
Hmm, I see that you set up the backup skill, but I don't see that we set up a trigger. The last 3 days you have been frustrated with cron, want me to edit HEARTBEAT.md to have it run the backup skill? How often do you want to run your backup skill?

### Input
```
You're right, we should add something in HEARTBEAT.md to point to our backup skill. #decision Um, I don't know, how long do you think? Can you have it run once a day?

### Output
```
I see that you are in central time- how about 11:30PM?

### Input
```
11:30pm it is #decision
END

### Output
```
✅ FOCUS ended — 2026-05-02 23:58 UTC

📋 Decisions promoted to MEMORY.md:
  • "HEARTBEAT.md triggers backup skill" promoted to MEMORY.md
  • "backup skill runs at 11:30PM Central time once a day" promoted to MEMORY.md

📁 Handoff written to: memory/daily/2026-05-02.md
🔄 GitHub backup pushed

💡 1% Better: What one thing could be better next FOCUS?
[Response saved to session improvements]

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
