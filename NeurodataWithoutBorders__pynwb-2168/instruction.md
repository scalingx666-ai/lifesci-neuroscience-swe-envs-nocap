# Issue

**Title:** Add Python 3.14 support

## Description

## Summary
- Add Python 3.14 classifier to `pyproject.toml`
- Add `314` to all tox env lists and move `upgraded`/`prerelease` envs from `py313` to `py314`
- Add Python 3.14 pinned entries and update upgraded/prerelease entries across all CI workflows (`run_all_tests.yml`, `run_tests.yml`, `run_coverage.yml`, `deploy_release.yml`)
- Add `"3.14"` to bug report template Python version dropdown
- Update docs to list Python 3.14 as supported

## Test plan
- [x] CI passes on all matrix entries
- [x] Python 3.14 pinned, upgraded, and prerelease jobs run successfully

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16886ae3f84b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.