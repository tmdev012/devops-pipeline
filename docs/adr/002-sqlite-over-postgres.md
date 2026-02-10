# ADR-002: SQLite Over PostgreSQL

## Status: Accepted
## Date: 2026-02-05

## Context
Need persistent storage for query history, commits, kanban tasks, session data.

## Decision
SQLite in WAL mode. Single file, zero config, works everywhere including Termux.

## Consequences
- **Pro**: No server process, zero dependencies, works on phone
- **Pro**: WAL mode handles concurrent reads efficiently
- **Con**: Single-writer only (fine for single-user tool)
- **Con**: No network access (fine — this is local-first by design)
