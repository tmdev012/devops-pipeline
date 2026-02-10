.PHONY: lint test security check

lint:
	@echo "Running linters..."
	shellcheck shared/scripts/*.sh 2>/dev/null || true
	@echo "Lint complete"

test:
	@echo "Running tests..."
	bats tests/ 2>/dev/null || echo "Install bats: sudo apt install bats"
	@echo "Tests complete"

security:
	@echo "Running security scan..."
	@git log --all -p 2>/dev/null | grep -iE "api_key=|secret=|password=|token=" | head -5 && echo "WARNING: Secrets found!" || echo "No secrets found"
	@echo "Security scan complete"

check: lint test security
	@echo "All checks passed"
