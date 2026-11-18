# Issue

**Title:** Build ptaylor stuff without SUMA (and X)

## Description

A user mentioned that our build was missing `3dClusterize`. I had Claude take a look and it claims that the `ptaylor` src is currently guarded by COMP_SUMA (and thus X et al), which we don't build. Moving this (and the GSL dependency) out of that guard into another that would satisfy `COMP_COREBINARIES OR COMP_SUMA` makes 3dClusterize build fine.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86c4e8822786`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.