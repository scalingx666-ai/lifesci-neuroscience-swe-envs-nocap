# Issue

**Title:** Speed up CSD and PSD computations

## Description

Speed up spectral estimation (should help with ). Gives a ~4x speedup in `csd_array_multitaper` and ~1.2-2x in `psd_array_multitaper`. Managed to DRY the code a little bit at the same time, and peak memory usage went down a bit 🚀. Investigated and implemented with Claude Opus 5.5 and reviewed and iterated on by me. (I think it's probably not worth a changelog entry.) Pushing with circle full to make sure nothing breaks here but I think we can really trust our unit tests on this one.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `457ec41f1475`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.