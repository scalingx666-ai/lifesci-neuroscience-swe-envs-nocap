# Issue

**Title:** Update HDMF dependency to >=5.0.0, <6

## Description

## Summary
- Updated HDMF dependency range from `>=4.1.2,<5` to `>=5.0.0,<6`
- Updated pinned versions in `requirements.txt`, `requirements-min.txt`, and `environment-ros3.yml`
- Moved hdmf to pip section in `environment-ros3.yml` since 5.0.0 is not yet available on conda-forge

## Test plan
- [x] All 732 unit + integration tests pass locally with HDMF 5.0.1.dev
- [x] CI passes

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `beb774dc90ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.