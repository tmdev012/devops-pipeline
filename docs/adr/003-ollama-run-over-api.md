# ADR-003: `ollama run` CLI Over HTTP API

## Status: Accepted
## Date: 2026-02-08

## Context
v2.0 used `curl /api/generate` (HTTP API) for ollama queries. On CPU-only hardware with `stream:false`, this caused 15s+ timeouts.

## Decision
v3.0 switched all routes to `ollama run` (native CLI). Streams tokens, keeps model hot in memory.

## Evidence
- `ollama run` = seconds (streaming, model stays loaded)
- `curl /api/generate stream:false` = 15s+ timeout on CPU-only
- The CLI manages model lifecycle better than raw HTTP on resource-constrained hardware
