# Issue

**Title:** Thapa2025: declare sessions per the loader-default rule (b)

## Description

Applies the counting rule Bruno fixed on 2026-10-05: `sessions_per_subject` describes what the loader returns by default, the cohort distribution goes in the docstring. Thapa2025 released 23 subjects with 49 sessions ({1 session: 2 subjects, 2: 16, 3: 5}, matching the paper and the converted BIDS tree on nm000324); the docstring and metadata now say so instead of a flat '3'. The NEMAR deposit README (nm000324) and PardoGarcia2026's (nm000309) were updated the same way; PardoGarcia2026's loader already followed the rule. Synthetic test adjusted; no behaviour change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7e0951120b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.