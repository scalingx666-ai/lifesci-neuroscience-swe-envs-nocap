# Issue

**Title:** [MAR-2531] Remove copying from hot scans

## Description

## Human summary

Hot repository scans now avoid repeated copying, making validation and baseline discovery scale more predictably on large repositories.

## Summary

- Replace accumulator-spread record scanning with local mutable builders that preserve sorted traversal and validation issue order.
- Build duplicate, supersession, active-head, and artifact validation issue lists without repeatedly cloning arrays or active groups.
- Update baseline language and top-level fact scanning to mutate local state instead of cloning the language-count map and arrays per entry.
- Add regression coverage for dense same-subject validation ordering, baseline output ordering, and source guards against reintroducing the hot-loop copy patterns.
- Local benchmark probe:
  - 1,000 same-subject records validated in 29.15 ms, heap delta 0.32 MiB.
  - 10,000 same-subject records validated in 202.97 ms, heap delta 0.05 MiB.
  - 100,000-file baseline scan completed in 71.58 ms, heap delta 0.05 MiB.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1c75d97b97e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.