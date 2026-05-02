# HEARTBEAT.md — TODD-F0WCUS (mf-st-thad-v1)

**OpenClaw heartbeat configuration for the unified memory framework.**
Adapted from Thad-FoWCuS; integrated with MEMORY-FLOW + Stuart.

## Session Start

- Read startup files (SOUL.md, USER.md, IDENTITY.md)
- Load memory context:
  - `memory/loops.md` — open loops
  - `MEMORY.md` — key decisions
  - Last 3 daily files — recent handoffs
- Check for active conversation — if yes, skip heavy loads
- Check for unclosed session marker (`memory/.session-active`)

## Memory Rules

- Write to daily notes after important conversations
- Check MEMORY.md before answering questions about past events
- Tag decisions with `#decision` inline; promote to MEMORY.md at END
- Keep MEMORY.md light — full details in daily/project files
- Verify writes succeeded

## 1% Better

- Each session, add one improvement to notes
- Every 5 sessions (or configured interval), prompt at END:
  > "1% Better: What's one thing you learned, improved, or want to do differently?"
- Save to today's daily under "Session Improvements"

## Witness Protocol (optional)

- If enabled in `references/focus-best-practices.md`
- During session, if something feels significant:
  > "This seems like a moment — [brief acknowledgment]. Should I note it?"
- Don't just respond — acknowledge the human's state

## Emotion Check (optional)

- If enabled in `references/focus-best-practices.md`
- During session, if noticeable shift in tone/topic:
  > "This seems to be landing differently for you — want to note it?"
- Track as: "Emotional awareness: [note]" in session notes

## Post-Session Write

- After each END, write summary to daily notes:
  - What was done
  - Decisions made (`#decision`)
  - What's next
- Promote `#decision` tags to MEMORY.md if user approved

## System Health (mega-sync trigger)

Periodically run `mega sync` to verify:
- GitHub sync status
- Memory file count and health
- Open loop count
- Session count and 1% Better progress