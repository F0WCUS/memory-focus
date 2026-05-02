---
name: memory-focus Root Signposts
date: 2026-05-02 22:02 UTC
repo_source: mf-st-thad-v1 synthesis
tags:
  - Root Signposting
  - F0WCUS
title: "ROOT_SIGNPOSTS — F0WCUS Unified Memory Framework"
---

# ROOT_SIGNPOSTS

**memory-focus — Unified Memory Framework for HeyRon Agents**
mf-st-thad-v1 | MEMORY-FLOW + Stuart + Thad-FoWCuS synthesis

## Skills

| Skill | Path | Triggers | Category |
|-------|------|----------|----------|
| memory-focus | SKILL.md | BEGIN, END, sync, study, mega sync, 1% better | memory |
| memory-flow | skills/memory-flow/SKILL.md | BEGIN, BEGIN quick, END, REMIND ME, 1% better | memory/session |
| sync | skills/sync/SKILL.md | sync, sync now | memory/longterm |
| study | skills/study/SKILL.md | study, refresh memory, catch me up | memory/longterm |
| mega-sync | skills/mega-sync/SKILL.md | mega sync, system check | memory/system |
| setup | setup/MEMORY-FLOWCUS-Setup.md | setup, configure | setup |
| cookbook-minimal | cookbook/minimal/SKILL.md | cookbook minimal, lightweight | memory/recipe |
| cookbook-standard | cookbook/standard/SKILL.md | cookbook standard | memory/recipe |
| cookbook-complete | cookbook/complete/SKILL.md | cookbook complete | memory/recipe |

## Framework Components

- README.md — Entry point and overview
- SKILL.md — Main skill (comprehensive framework documentation)
- HEARTBEAT.md — OpenClaw heartbeat configuration
- skills_catalog.yaml — Machine-readable catalog (all skills indexed)
- setup/MEMORY-FLOWCUS-Setup.md — 10-question setup wizard
- references/focus-best-practices.md — User preferences (filled by wizard)
- templates/
  - daily-log-template.md — Session handoff format
  - loops-template.md — Open loop registry format
  - MEMORY.md-template.md — Long-term memory structure
- scripts/
  - bootstrap-memory.sh — Create memory/ directory
  - prune-loops.sh — Soft warn at 10 loops
  - stale-loop-checker.sh — Flag 7+ day loops
  - github-backup.sh — GitHub handoff backup
- cookbook/
  - minimal/ — Lightweight, casual use
  - standard/ — Recommended, full framework
  - complete/ — Everything enabled, power users