# DevOps Pipeline

> Cross-repo CI/CD templates, engineering standards, ADRs, and shared automation. The backbone that enforces quality across all tmdev012 repositories.

[![CI](https://img.shields.io/badge/CI-GitHub_Actions-2088FF)]()
[![Repos](https://img.shields.io/badge/repos_managed-9-green)]()
[![Standards](https://img.shields.io/badge/standards-CMMI_L3+-blue)]()

---

## Why This Repo Exists

Most developers have scattered repos with inconsistent quality. This repo is the control plane — it defines **how** every other repo should work: CI pipelines, testing standards, security scanning, documentation templates.

A repo without CI is a repo nobody trusts. A repo without tests is a repo nobody can safely change. This repo fixes both, across the entire portfolio.

---

## What a Senior Engineer Sees Here

| Signal | Evidence |
|--------|----------|
| **Process maturity** | 8 consistent labels across 9 repos, 45 tracked issues |
| **CI/CD** | Reusable workflow templates (build → lint → test → deploy) |
| **Security posture** | Secret scanning, dependency audit, gitleaks config |
| **Architecture thinking** | ADRs document every significant decision |
| **Code quality** | Pre-commit hooks, editorconfig, linter configs |
| **Testing discipline** | Coverage thresholds enforced in CI |
| **Documentation** | Contributing guide, runbooks, architecture diagrams |
| **Traceability** | Issues → commits → releases → changelog |

---

## Repository Map

```
tmdev012/
├── ollama-local          # AI CLI (sashi v3.1) — local LLM, SQLite, smart-push
├── kanban-pmo            # PMO framework — gRPC, Kanban, CMMI L3
├── devops-pipeline       # THIS REPO — CI/CD templates, standards, ADRs
├── Nemo                  # Project Nemo
├── vercel_deploy         # Vercel deployment automation
├── timetrakr / timetrakr- # Timesheet maker app
├── calendaR              # Activity tracking as commits
├── Calendar_frontend-    # 3js landing page + dashboard
├── TermuxHub             # Android Termux tool indexer
└── github-explorer       # GitHub integration for Cinnamon Linux
```

Each repo has the same 5 engineering issues:
1. **CI/CD** — GitHub Actions pipeline
2. **Quality** — Pre-commit hooks + code standards
3. **Security** — Dependency audit + secret scanning
4. **Testing** — Test framework + coverage threshold
5. **Docs** — ADRs + contributing guide + architecture

---

## Reusable CI Templates

### Basic CI (any repo)
```yaml
# Copy to .github/workflows/ci.yml
name: CI
on: [push, pull_request]
jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Lint
        run: make lint
      - name: Test
        run: make test
      - name: Security scan
        run: make security
```

### Shell Project CI (ollama-local, kanban-pmo)
```yaml
name: Shell CI
on: [push, pull_request]
jobs:
  shellcheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: ShellCheck
        uses: ludeeus/action-shellcheck@master
      - name: BATS tests
        run: |
          sudo apt-get install -y bats
          bats tests/
```

### Python Project CI (kanban-pmo API)
```yaml
name: Python CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: '3.10' }
      - run: pip install -r requirements.txt
      - run: pytest --cov=. --cov-fail-under=60
```

---

## Engineering Standards

### Commit Convention
```
type(scope): description

Types: feat, fix, docs, ci, refactor, test, perf, security
Scope: optional, e.g. (sashi), (kanban), (ci)

Examples:
  feat(sashi): add 8B model support via swap
  fix: num_thread 4→2, HT contention on 2-core CPU
  ci: add shellcheck + BATS to GitHub Actions
  security: enable dependabot + secret scanning
```

### Branch Strategy
```
main              ← production, always green
├── feat/xxx      ← feature branches
├── fix/xxx       ← bug fixes
└── release/x.y   ← release candidates
```

### Code Review Checklist
- [ ] Tests pass locally
- [ ] No secrets in diff
- [ ] Linter clean
- [ ] Docs updated if behavior changed
- [ ] Commit messages follow convention
- [ ] No unnecessary files (node_modules, .env, etc.)

---

## Architecture Decision Records

| ADR | Decision | Date | Status |
|-----|----------|------|--------|
| [001](docs/adr/001-local-first-ai.md) | Local-first AI via Ollama (no cloud dependency) | 2026-02-08 | Accepted |
| [002](docs/adr/002-sqlite-over-postgres.md) | SQLite over PostgreSQL for single-user persistence | 2026-02-05 | Accepted |
| [003](docs/adr/003-ollama-run-over-api.md) | `ollama run` CLI over HTTP API for CPU-only hardware | 2026-02-08 | Accepted |
| [004](docs/adr/004-num-thread-2.md) | num_thread=2 (physical cores) over 4 (HT) | 2026-02-10 | Accepted |
| [005](docs/adr/005-archive-not-rebase.md) | Archive files, never delete or rebase | 2026-02-08 | Accepted |

---

## Cross-Repo Issue Dashboard

All 9 repos have consistent issues tracked with the same labels:

| Label | Color | Count | Meaning |
|-------|-------|-------|---------|
| `ci/cd` | green | 9 | Pipeline automation |
| `quality` | purple | 9 | Code standards enforcement |
| `security` | red | 9 | Audit and scanning |
| `testing` | blue | 9 | Test framework + coverage |
| `docs` | lavender | 9 | Documentation standards |
| `priority:high` | orange | 27 | Must complete this sprint |
| `priority:medium` | yellow | 18 | Should complete this sprint |
| `architecture` | teal | 9 | Design decisions |

**Total tracked issues: 45 across 9 repos**

---

## License

MIT

---

*Built with Claude Code (Opus 4.6) — Feb 2026*
