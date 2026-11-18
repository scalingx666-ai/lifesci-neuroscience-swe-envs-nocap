# Issue

**Title:** Refactor STDP and event ops for new brainevent binary backend

## Description

## Summary by Sourcery

Update event-based computation and STDP weight update implementations to use new binary/event abstractions and aligned brainevent backends, while adjusting dependencies and minor docs.

Bug Fixes:
- Align STDP weight update functions with binary pre/post update helpers for dense and CSR connectivity.
- Update event-based matvec/matmat operations to use BinaryArray and JITCScalarR backends compatible with newer brainevent versions.

Enhancements:
- Simplify numpy compatibility layer by dropping the unused fix wrapper.
- Tidy initialization module header placement and add a small __main__ check in brainpy.state for basic exports inspection.

Build:
- Raise brainevent dependency to >=0.0.7 in pyproject.toml and requirements.txt and drop Python 3.10 classifier.

Documentation:
- Clarify brainpy.state README title and correct installation command to use the brainpy.state package name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0b47d155c14`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.