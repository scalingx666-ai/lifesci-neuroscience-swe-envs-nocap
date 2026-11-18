# Issue

**Title:** Add moving average option for ML classifiers

## Description

- Implement `MovingAverageClassifier` in C++ core supporting custom scores and built-in metric models
- Add `MOVING_AVERAGE_CLASSIFIER` enum across Python, Java, C#, TypeScript, Rust, Swift, Julia, and MATLAB bindings
- Add automated test `moving_average_classifier.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9097190cc70f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.