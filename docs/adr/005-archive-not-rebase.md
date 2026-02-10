# ADR-005: Archive Files, Never Delete or Rebase

## Status: Accepted
## Date: 2026-02-08

## Context
Previous sessions created files that were later superseded. Git rebase or force-push could clean history but destroys context.

## Decision
Move superseded files to `old-archive/session-YYYY-MM-DD/`. Never delete. Never rebase.

## Consequences
- **Pro**: Full audit trail — every session's work is preserved
- **Pro**: Can always recover or reference old approaches
- **Pro**: Git history is clean and linear (no force-push)
- **Con**: Repo size grows over time (mitigated by .gitignore on binaries)
