# Issue

**Title:** Usability fixes

## Description

# Overview

Minor changes needed to be able to use the simulator for evaluating the new language model.

## Contributions

- Wired up some attributes from the configured parameters file.
- Added the ability to optionally select a subset of data directories using a glob pattern.
- Defaulted the sim_parameters to always include a language model.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29a5b24eee9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.