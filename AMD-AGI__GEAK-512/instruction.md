# Issue

**Title:** Add gfx1151 to the tuning skillset's arch tables

## Description

## Add gfx1151 to the tuning skillset's arch tables

Three places in the vendored tuning skillset (`perf_knowledge/expert_skills/tuning/`) assumed CDNA. Add RDNA3.5 support.

### Testing
- Ran the full L0 pytest list and checked coverage against the 97% gate
- Ran the contract checks, KB lint and index, expert-skill validation, and the node regressions
- `shapes.py --arch gfx1151` now runs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8b10fd824c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.