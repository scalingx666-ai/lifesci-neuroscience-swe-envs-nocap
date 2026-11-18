# Issue

**Title:** [ENH] Make Pharmaceutical metadata terms less PET-specific

## Description

We are to introduce use of Pharma* fields into BEP032 (#1705) where it has no notion of tracers. I am moving this extra description to become PET specific, but also @bids-standard/raw-pet  people might want to double check if that is what was actually intended (or it could be administered separate from the tracer

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a7a9d804d35b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.