# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## Memory Retrieval (QMD)

**DO NOT use built-in `memory_search` tool.** Use QMD via exec instead.

### Read Path (searching)
```bash
# 1. Try keyword search first (fast, BM25)
qmd search "query" -n 5

# 2. Only if keyword search misses, use semantic search
qmd vsearch "query" -n 5

# 3. Skip qmd query unless user asks for "deep search"
```

### Write Path (unchanged)
- Still write to `memory/YYYY-MM-DD.md` and `MEMORY.md` as normal
- QMD indexes these files automatically

### Critical Habit
**After ANY memory write, run:**
```bash
~/.bun/bin/qmd update
```
This keeps the index current with new entries.

### Collections
- `workspace` — my memory files, config, identity
- `docs` — Mantis/OpenClaw documentation
- `skills` — agent skill definitions

### Why
- Token efficient (snippets vs full files)
- Better retrieval with BM25 + vectors
- Validating before building a plugin

## Accounts (Mine! 🦗)

### Email
- **Address:** mantisclaw@mantisbox.com
- **Connected to:** Mail.app on this Mac
- **Status:** ✅ Working via AppleScript
- **Scripts:** `scripts/email-check.scpt`, `scripts/email-send.scpt`

### Apple ID (iMessage)
- **Account:** team@mantisbox.com  
- **Connected to:** Messages.app on this Mac
- **Status:** 🔧 Setting up — waiting for `imsg` install

## System Notes

- **Host:** Confetti's MacBook Pro (2)
- **Role:** Dedicated MantisClaw machine, always-on
- **Homebrew:** Needs permission fix before installing packages

## Channel Setup Progress

| Channel | Status | Notes |
|---------|--------|-------|
| Web chat | ✅ Working | Current session |
| iMessage | 🔧 In progress | Need `imsg` installed |
| Email | ⏳ Planned | Will use AppleScript or custom skill |
| Telegram | - | Not configured |
| WhatsApp | - | Not configured |
| Discord | - | Not configured |

---

Add whatever helps you do your job. This is your cheat sheet.
