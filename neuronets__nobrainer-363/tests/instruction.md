# Issue

**Title:** feat: experiment tracking, class weights, 50-class kwyk config

## Description

## Summary

Adds to the multi-GPU/SLURM PR (already merged as #362):
- `nobrainer/experiment.py`: ExperimentTracker with local (JSONL/CSV) + optional W&B backends, integrated via `.callback()` pattern
- `nobrainer/losses.py`: `compute_class_weights()`, `weighted_cross_entropy()`, `DiceCELoss`
- `Segmentation.fit(class_weights=...)`: accepts "auto", tensor, or None
- kwyk config updated to 50-class parcellation (matching paper), class weights default to null (matching paper)

## Test plan
- [x] 12 new unit tests (9 class weights + 3 experiment tracker)
- [ ] CI

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87568906f527`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.