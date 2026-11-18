# Issue

**Title:** fix: Use consistent skull-stripping pre- and post- SDC

## Description

Overall seems safe, the `skullstrip_wf` is extracted from the `enhance_and_skullstrip_wf`, skipping reruns.

Running locally now. We'll see if does address #3406.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `910c232e20e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.