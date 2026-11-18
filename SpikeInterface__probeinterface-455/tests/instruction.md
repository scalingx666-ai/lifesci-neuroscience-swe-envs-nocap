# Issue

**Title:** Fix backward compatibility of to/from numpy

## Description

Backward compativility fix, see https://github.com/SpikeInterface/spikeinterface/actions/runs/29007532484/job/86082737472?pr=4636

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a07f3bb3aa90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.