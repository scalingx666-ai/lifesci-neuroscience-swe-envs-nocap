# Issue

**Title:** [PR] ACE models release

## Description

This PR officially adds the now publicly available ACE models to MIRACL. There are also several improvements to the installation script.

@Andrew-Clappison could you please test the new installation script, check the changes in the `README.md` and the docs and re-run the tests for ACE?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04bc850b7486`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.