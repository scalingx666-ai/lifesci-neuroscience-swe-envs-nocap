# Issue

**Title:** Add FSL 6.0.7.20, 6.0.7.21, 6.0.7.22 to fsl template

## Description

## Summary
- Add three missing FSL releases to the fsl.yaml template: 6.0.7.20, 6.0.7.21, 6.0.7.22
- All use the same `fslinstaller.py` installer as existing 6.0.7.x entries
- 6.0.7.22 (released 2026-03-27) includes `applywarp` performance/memory improvements and XTRACT fixes

Release notes: https://fsl.fmrib.ox.ac.uk/fsl/docs/development/history/index.html

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `188a7298b37f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.