# Issue

**Title:** ds105 fmri example with single runs being fit

## Description

- Modified the FIAC example to start trying to analyze https://openfmri.org/dataset/ds000105
- Added a block_design function, and options to output individual terms for an experimental factor.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5cc72af09b76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.