# Issue

**Title:** Abort if a CoreNEURON dataset ion name lacks the _ion suffix.

## Description

Deus Rex <deusrex.ai> reported that an ion line in bbcore_mech.dat whose name is not <stem>_ion makes ion_reg index nrn_ion_global_map with -1. A name shorter than four characters also writes before the stem buffer. An ion line now aborts unless the name is longer than "_ion" and ends in "_ion". #3932 does not change this path.

A dataset is a directory the operator chose, written by NEURON and loaded by nrniv-core. The change aborts that ion line before ion_reg. The counts that size the binary records, those records, and the user's HOC, Python, and MOD VERBATIM are outside this fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9eb469be7dbc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.