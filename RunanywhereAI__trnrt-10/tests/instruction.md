# Issue

**Title:** Pre-launch cleanup: no private trace patterns in the repo; verification status

## Description

- tests/test_no_trace.py reads private patterns from a file outside the repository (TRNRT_TRACE_PATTERNS); the always-on check allows the upstream name only on NOTICE's attribution line.
- AGENTS.md: drop the number-tagging sentence.
- README, RESULTS, KNOWN_ISSUES, MEGAKERNELS: the graph-equivalence, output and serve checks passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edd0039db74e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.