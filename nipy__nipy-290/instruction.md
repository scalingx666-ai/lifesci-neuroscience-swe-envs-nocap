# Issue

**Title:** MRG: thinking of an interface for HRF convolution

## Description

I'm trying to work out a good interface to express the fact that generally,
when we convolve things with HRFs, we want the same interval for the kernel,
and the same dt.

Maybe we could have an HRF object, that has a 'convolve' method, maybe an
'evaluate' method (to evaluation the real function at given time values, and a
`symfunc` property for the symbolic function.

I haven't really thought this last part through.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ddd0ecc5b1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.