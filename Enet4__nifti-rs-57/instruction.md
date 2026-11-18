# Issue

**Title:** Make code more robust to OOM attacks

## Description

I found a few more edge cases through fuzzing (just in case, the fuzz project is currently in the [fuzz](https://github.com/Enet4/nifti-rs/tree/fuzz) branch). Not all cases of out-of-memory (OOM) attacks can be solved, but this will at least solve the trivial (yet very problematic) case of OOM by attempting to read a file which claims to have an extremely large size via `dim`.

Summary:

- Check for arithmetic overflow when calculating the size of the volume.
- Only pre-allocate volumes and extension data up to a sane size to prevent trivial OOM attacks.
- Add 3 fuzz test cases for `InMemNiftiObject` that used to lead to panics or even aborts (!).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd804f5a1bc7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.