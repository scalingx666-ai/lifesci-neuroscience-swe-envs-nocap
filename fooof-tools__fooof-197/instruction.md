# Issue

**Title:** [MNT] - Update peak extraction array & describe index column

## Description

As mentioned in this issue (#192) - there is a deprecation with newer numpy on how we were managing peak parameters in FOOOFGroup.get_params. Issue was we were calling `np.array` on a list of array. This can simply be replaced by `np.vstack`, to avoid the issue with typecasting the messy list object to an array.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d21c5351b476`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.