# Issue

**Title:** Move HuggingFace extractor helpers to module

## Description

This PR simply ports HuggingFaceConfig/HuggingFaceMixin to a new file huggingface.py since base.py is becoming huge

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `850801d8dc28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.