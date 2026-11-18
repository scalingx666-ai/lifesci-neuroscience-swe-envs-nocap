# Issue

**Title:** Flip Wang2026Handwriting to cognitive paradigm

## Description

CCS-HI stroke imagery + SV-HI vowel imagery join Shin2017B + BNCI2024_001 under paradigm=cognitive (CognitiveTask, #1056).

- Loader + METADATA + detected_paradigm=cognitive, tags cognitive/cognitive, docstring
- Summary row imagery->cognitive, api.rst listing, whats_new
- Tests switched MotorImagery->CognitiveTask, 7/7 offline green
- Verified: paradigm=cognitive, search + summary consistent, ruff clean

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a9e72b2ea71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.