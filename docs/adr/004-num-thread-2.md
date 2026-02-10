# ADR-004: num_thread=2 (Physical Cores Only)

## Status: Accepted
## Date: 2026-02-10

## Context
i7-6500U has 2 physical cores, 4 hyperthreads. Initial assumption: more threads = faster inference.

## Decision
Set `num_thread 2` in all Ollama Modelfiles. Do NOT use 4.

## Evidence (3 rounds of benchmarking)
| num_thread | 3B tok/s | 8B tok/s |
|------------|----------|----------|
| 4 (all HT) | 2.8 | 3.0 |
| **2 (phys)** | **4.0** | **3.7** |

**+43% faster on 3B, +23% on 8B with fewer threads.**

## Why
LLM inference is pure compute. Hyperthreads share execution units with physical cores. On compute-bound workloads, HT contention causes cache thrashing and pipeline stalls. Physical cores only = clean execution.

## Consequences
- 2 threads for inference, leaving 2 HT threads free for OS/shell
- Applies to all Modelfiles (Modelfile.system, Modelfile.8b)
