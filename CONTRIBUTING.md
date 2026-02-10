# Contributing

## Quick Start
1. Fork the repo
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Make changes, commit with conventional format
4. Open a PR against `main`

## Commit Convention
```
type(scope): description

Types: feat, fix, docs, ci, refactor, test, perf, security
```

## Code Quality
- Run `make lint` before committing
- Pre-commit hooks will catch common issues
- All PRs require CI to pass

## Branch Naming
- `feat/description` — new features
- `fix/description` — bug fixes
- `docs/description` — documentation only
- `ci/description` — CI/CD changes
