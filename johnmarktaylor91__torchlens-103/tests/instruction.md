# Issue

**Title:** fix(vis): clean up intermediate .gv source files after rendering

## Description

## Summary
- Add `cleanup=True` to `dot.render()` so graphviz deletes the intermediate `.gv` dot source file after rendering, leaving only the rendered output (e.g. `.pdf`)

## Test plan
- [x] Smoke tests pass (`pytest tests/ -m smoke -v`)
- [x] Verified no stray `.gv` files in `tests/test_outputs/` after rendering

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `808aebceec54`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.