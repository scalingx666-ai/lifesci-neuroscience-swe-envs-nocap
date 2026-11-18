# Issue

**Title:** Allow automatically digesting .gz files of gzipped types listed in `DECODERS`

## Description

Also, includes:
- maintenance of `HttpRequest`
- Flake8 rule exclusion: E731 - do not assign a lambda expression

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fe16c2ff6dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.