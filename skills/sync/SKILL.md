---
name: sync
description: Save conversations to memory with REQUIRED tags + auto-suggest. Use when you want to save a session - says "sync".
license: Proprietary
metadata:
  author: Jeem & Stuart
  version: "1.2"
  triggers:
    - sync
    - sync now
  category: memory
---

# Sync - Save to Memory with Tags + Auto-Suggest

**⚠️ CRITICAL: TAGS ARE REQUIRED!**

This skill saves sessions to memory files with mandatory tagging + auto-suggestion of additional tags based on conversation topics.

---

## When to Use This Skill

Triggered when the user says:
- "sync"
- "sync #tagname"
- "sync now"

---

## The Sync Process (7 Steps)

### Step 1: PARSE TAGS (REQUIRED!)

**⚠️ THIS IS MANDATORY - DO NOT SKIP!**

1. Extract tag from user input
2. If NO tag provided, use `#session` as DEFAULT
3. If tag provided without #, add # prefix

**Examples:**
| Input | Tag Used |
|-------|----------|
| `sync #knicks` | `#knicks` |
| `sync #team` | `#team` |
| `sync` | `#session` (DEFAULT) |

### Step 2: ANALYZE CONVERSATION (REQUIRED!)

**⚠️ THIS IS MANDATORY - DO NOT SKIP!**

After parsing the user's tag, analyze the conversation to find topics and suggest additional tags:

1. Scan recent conversation for keywords:
   - Sports teams → #ravens, #knicks, #lions, #blackhawks
   - Projects → #project, #agent-jam, #memory-kit
   - People → #team, #team, #austin, #janet
   - Personal → #personal, #family, #hobbies
   - Work → #work, #it-support
   - Money → #business, #money, #startup

2. Compile list of suggested tags (max 3)
   - Only suggest if different from user's tag
   - Prioritize the most relevant topic

3. Ask user if they want to add suggestions:
   ```
   "I noticed you talked about [topics]. Want me to add [#tag1 #tag2] too?"
   ```

**If user says YES:** Add suggested tags to the tag list
**If user says NO:** Keep only the original tag
**If user provides MORE tags:** Add those too

### Step 3: CREATE MEMORY FILE

Create file with today's date:
```bash
memory/YYYY-MM-DD.md
```

### Step 4: ADD SESSION CONTENT

Add to file:
- **What** - What happened
- **Decisions** - Key decisions made (tag as #decision)
- **Topics** - Topics discussed
- **Tasks** - Open todos (tag as #task)
- **Notes** - Additional notes
- **Tags** - All tags from Step 1 + Step 2

### Step 4.5: ADD PRIORITY TAG (REQUIRED!)

**⚠️ MANDATORY - Per SOUL.md Memory Rules!**

After analyzing conversation content, you MUST add priority tag:

| If... | Then tag as... |
|-------|---------------|
| Made decisions, created tasks, milestones | `#important` |
| Casual chat, check-ins, routine updates | `#routine` |

**Examples:**
- "We decided to add memory rules" → #important #decision
- "Just chatting about the game" → #routine

### Step 4.6: CHECK CROSS-REFERENCES (NEW!)

Before saving, check if this topic relates to previous entries:
- Search recent memory files for related topics
- If found, add "Related to: YYYY-MM-DD.md#topic" line
- This builds our knowledge graph!

### Step 5: GIT PULL

Before pushing, pull latest:
```bash
cd ~/workspace && git pull --rebase
```

### Step 6: GIT PUSH

Push to GitHub:
```bash
git add memory/ YYYY-MM-DD.md && git commit -m "Memory: Session" && git push
```

### Step 7: CONFIRM

Report to user:
- File saved
- All tags used
- GitHub status

---

## Standard Tags

| Tag | When to Use |
|-----|-------------|
| `#session` | Default - any conversation |
| `#team` | Team collaboration |
| `#project` | Project work |
| `#decision` | Key decisions made |
| `#personal` | Personal stuff |
| `#topicname` | Any topic (make up your own!) |

**Make up your own tags!** Examples:
- `#knicks` - Knicks conversation
- `#ravens` - Ravens conversation
- `#hobbies` - Hobbies
- `#work` - Work stuff
- `#agent-jam` - Agent Jam competition
- `#memory` - Memory system topics

---

## Auto-Suggest Examples

| Conversation | Suggested Tags |
|--------------|----------------|
| "Talked about Knicks game" | #knicks |
| "Heyron Agent Jam meeting with Austin" | #agent-jam, #team |
| "Business ideas for money" | #business, #money |
| "Dinner planning" | #personal, #family |
| "Printer at work not working" | #work, #it-support |

---

## Output Format

```markdown
## 🔄 Sync Complete

**Saved:** memory/2026-04-30.md
**Tags:** #session #agent-jam #team
**GitHub:** ✅ Synced
```

---

## Error Handling

| Scenario | What to Do |
|----------|------------|
| No tag given | Use `#session` as default |
| File exists | Append to existing file |
| Git conflict | Resolve, then push |
| Tag without # | Add # prefix |
| No suggestions | Just use user's tag |

---

## Related Skills

- `skills/study` - Load memories by tag
- `skills/mega-sync` - System health check
- `skills/tagger` - Dedicated tag analysis skill (future)

---

## Time Estimate

| Step | Time |
|------|------|
| Parse tags | 5s |
| Analyze + suggest | 10s |
| Create file | 5s |
| Add content | 1 min |
| Git pull/push | 15s |
| Confirm | 5s |
| **Total** | **~90s** |

---

*Skill version: 1.1 - Last updated: May 1, 2026*
*Note: v1.1 - Added mandatory auto-suggest step*-e 
---

## VERIFY

After completing, verify:
1. File changes saved
2. GitHub push successful
3. No errors in output
