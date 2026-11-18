# Issue

**Title:** MNT CI and README maintenance

## Description

## Summary
- Increase pytest step timeout from 10 to 20 minutes
- Remove TestPyPI publishing job and `workflow_dispatch` trigger from `publish.yml`
- Update Python version badge from 3.6+ to 3.10+
- Add codecov and PyPI badges to README
- Add manual trigger (`workflow_dispatch`) for gh-pages deployment

## Test plan
- [ ] Verify `run_tests.yml` timeout is 20 minutes
- [ ] Verify `publish.yml` only triggers on release and publishes to PyPI only
- [x] Verify README badges render correctly
- [ ] Verify `build_docs.yml` can be manually triggered to deploy to gh-pages

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d07c81e5f9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.