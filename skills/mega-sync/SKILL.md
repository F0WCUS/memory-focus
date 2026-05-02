---
name: mega-sync
description: Complete system health check - GitHub sync, memory verification, OpenClaw status. Use when you need a comprehensive status check - says "mega sync".
license: Proprietary
metadata:
  author: Jeem & Stuart
  credits: "Original concept by Jeem & Stuart"
  version: "1.3"
  triggers:
    - mega sync
    - system check
    - check everything
    - full system
  category: system
  requires:
    - github
    - filesystem
    - openclaw
---

# Mega Sync - Complete System Health Check

This skill performs a complete system health check. It verifies OpenClaw is running, checks memory files, and syncs with GitHub.

## When to Use This Skill

Triggered when the user says:
- "mega sync"
- "system check"
- "check everything"
- "full system"
- "status"

---

## The Mega Sync Process (5 Steps)

### Step 1: CHECK GITHUB STATUS

```bash
cd ~/workspace && git fetch origin && git status -sb
```

Report:
- Ahead/behind status
- Pending commits count

### Step 2: VERIFY MEMORY FILES

Check memory directory:
```bash
ls -la memory/*.md | tail -10
```

Report:
- Number of memory files
- Last updated file

### Step 2.5: TAG STATISTICS (NEW!)

Count priority tags across all memory files:
```bash
echo "Important entries:" && grep -c "#important\|#decision" memory/*.md 2>/dev/null | awk -F: '{sum+=$2} END {print sum}'
echo "Routine entries:" && grep -c "#routine" memory/*.md 2>/dev/null | awk -F: '{sum+=$2} END {print sum}'
```

Report:
- #important / #decision count
- #routine count
- Cross-reference count (if time permits)

### Step 3: CHECK OPENS CLAW STATUS

Run session_status or check gateway:
```bash
curl -s http://localhost:3000/health 2>/dev/null || echo "Gateway running"
```

Report:
- Model in use
- Context usage
- Cache hit rate

### Step 4: PULL + PUSH

Sync with GitHub:
```bash
git pull origin main --rebase
git push origin main
```

Handle any divergence with force push if needed.

### Step 5: REPORT STATUS

Present unified report:

| System | Status | Details |
|--------|--------|---------|
| OpenClaw | ✅ Running | Model: MiniMax M2.5 |
| Memory | ✅ X files | Last: YYYY-MM-DD |
| GitHub | ✅ Synced | X commits |

---

## Output Format

```markdown
## 🔄 Mega Sync Results

| System | Status | Details |
|--------|--------|---------|
| OpenClaw | ✅ Running | Model: ... |
| Memory | ✅ X files | Last: ... |
| GitHub | ✅ Synced | X commits |

### Today's Wins
- [list any completed tasks or updates]

All systems go! ✅
```

---

## Error Handling

| Scenario | What to Do |
|----------|-------------|
| GitHub push fails | Retry with force push |
| Memory files missing | Note warning, continue |
| OpenClaw not responding | Show what we can verify |

---

## Related Skills

- `skills/study` - Load memories after sync
- `skills/remember` - Save session to memory
- `skills/recall` - Search memories
- `skills/skill-audit` - For skill verification

---

## Examples

### Example 1

**Input:** "mega sync"
**Output:** Complete system status report

### Example 2

**Input:** "system check"
**Output:** Verifies all systems operational

---

## Pro Tips

- Always pull before pushing to avoid divergence
- Check memory file count to ensure continuity
- Note any pending tasks in report

---

## Time Estimate

| Step | Time |
|------|------|
| Check GitHub | 5s |
| Verify Memory | 5s |
| Check OpenClaw | 10s |
| Pull + Push | 15s |
| Report | 5s |
| **Total** | **~40s** |

---

*Skill version: 1.2 - Last updated: May 1, 2026*
*Note: v1.2 - Updated skill-audit references*