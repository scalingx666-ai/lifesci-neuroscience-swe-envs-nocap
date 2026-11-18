# Issue

**Title:** Thalamic mass model

## Description

Simple thalamic conductance-based mass model, due to Schellenberger Costa et al.
A bit different from other models, since this is a thalamus-only model, i.e. doesn't work within a network. So far without inputs from other areas.

Left to do:
* [ ] example notebook
* [ ] inputs from other (cortical) areas

Reference: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005022

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1901766b19ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.