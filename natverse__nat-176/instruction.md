# Issue

**Title:** Handle reading/writing zip archives of multiple neurons

## Description

I'm not sure how we should document this, as the functionality is in `read.neuron` and `write.neuron`, although it makes more sense (at least to me) to call `read.neurons` and `write.neurons`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae206b6a3642`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.