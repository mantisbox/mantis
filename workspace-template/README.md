# Mantis Workspace Template

This directory contains the default workspace files for a Mantis AI assistant instance.

## Files

| File | Purpose |
|------|---------|
| `AGENTS.md` | Core operating instructions for the agent |
| `SOUL.md` | Personality and values |
| `IDENTITY.md` | Name, creature type, vibe, origin story |
| `USER.md` | Information about the human (customize this!) |
| `TOOLS.md` | Local notes about tools, accounts, preferences |
| `HEARTBEAT.md` | Periodic task checklist (empty by default) |
| `MANTIS_SPEC.md` | Product spec for Mantis SaaS vision |
| `memory/` | Daily memory logs |
| `scripts/` | AppleScript helpers for macOS (email) |

## Setup

To use this template for a new Mantis instance:

1. Copy this directory to `~/.mantis/workspace/`
2. Edit `USER.md` with the new user's information
3. Edit `IDENTITY.md` if you want a different personality
4. Clear or edit `memory/` files for a fresh start

## Memory Convention

- `memory/YYYY-MM-DD.md` — Daily logs of what happened
- Memory files are committed to git so the agent can be "revived" from history
- Always commit memory alongside code changes

## Scripts (macOS only)

- `scripts/email-check.scpt` — Check unread emails via Mail.app
- `scripts/email-send.scpt` — Send email via Mail.app

These require Full Disk Access for Terminal/node.

---

*This template represents MantisClaw the Wise — born 2026-02-05.*
