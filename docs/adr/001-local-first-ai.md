# ADR-001: Local-First AI via Ollama

## Status: Accepted
## Date: 2026-02-08

## Context
Cloud AI APIs (DeepSeek, OpenAI) have costs, latency, privacy risks, and can go down or cut you off (DeepSeek: "Insufficient Balance" — confirmed 2026-02-08).

## Decision
All AI queries route through `ollama run` on local hardware. Cloud is optional fallback via OpenRouter free tier.

## Consequences
- **Pro**: Zero cost per query, works offline, data never leaves the machine
- **Pro**: No vendor lock-in, no API key management
- **Con**: Limited to models that fit in RAM+swap (~8B max on 7.6GB+8GB swap)
- **Con**: Slower than cloud (~4 tok/s vs instant cloud responses)
