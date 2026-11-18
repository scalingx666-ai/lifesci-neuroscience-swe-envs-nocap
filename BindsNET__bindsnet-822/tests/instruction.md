# Issue

**Title:** Bump torch to 2.14.1 and torchvision to 0.29.1

## Description

Updates `poetry.lock` to the newest PyTorch patch releases (published 30 September 2026). `pyproject.toml` is unchanged: its ranges (`torch>=2.14,<3`, `torchvision>=0.29,<1`) already allow these versions, so pip installs were already getting them.

- torch 2.14.0 → 2.14.1 (PyPI and the cu130 index)
- torchvision 0.29.0 → 0.29.1 (PyPI and the cu130 index)
- No other package versions changed.

Tested locally with torch 2.14.1+cu130 and torchvision 0.29.1+cu130: `pytest -q` gave 256 passed.

Not checked: whether the patch release changes any trained-network numbers bit for bit.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a30b9dbb5d7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.