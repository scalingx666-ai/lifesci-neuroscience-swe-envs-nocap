# Issue

**Title:** Merge of analysis tools feature branch to main

## Description

This is a merger of the analysis-tools feature branch over to main -- this feature branch includes improvements/additions to specifically `ngclearn.utils`, particularly with the inclusion of the linear and attention probes for encoding vector downstream analysis (often done in self-supervised learning experiments).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ffd8f0e09bdd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.