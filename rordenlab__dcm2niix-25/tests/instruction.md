# Issue

**Title:** change tabs to spaces when exporting BIDS

## Description

.bval/.bvec files use spaces instead of tabs in BIDS, when the user asks for the sidecar JSON file we should switch the delimiter assuming that .bval/.bvec files should also be BIDS compatible.

This patch does not influence the format of .bvec/.bval files if the -b flag is not used so it should not break any backwards compatibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85582cad6c7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.