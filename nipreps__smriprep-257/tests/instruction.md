# Issue

**Title:** FIX: Account for label entity when querying brain mask

## Description

UNCInfant template currently fails, since the brain mask contains `label-brain` instead of `desc-brain`. AFAIK, `label` is the preferred entity for this.

This is a quick fix, but looking through the code, I think the `TemplateFlowSelect` interface as a whole needs a substantial rework. Was it envisioned as a nipype wrapper for `templateflow.api.get`?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `620216a2bee8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.