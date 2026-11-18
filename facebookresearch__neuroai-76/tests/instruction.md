# Issue

**Title:** Add StudyInfo-powered dataset explorer

## Description

## Summary
- Replace the static NeuralFetch dataset table with a generated StudyInfo-based explorer.
- Add scatterplot/table filtering by event type, hover metadata, and regenerated docs HTML.
- Regenerate the explorer automatically during Sphinx builds.

## Test plan
- `python docs/scripts/build_study_explorer.py`

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3646fdc5813`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.