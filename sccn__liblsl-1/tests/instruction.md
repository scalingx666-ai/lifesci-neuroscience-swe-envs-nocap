# Issue

**Title:** Declare const parameters as const

## Description

This PR picks up 322b5244e1faf9d77b42c0f10944523db0d74dab by @cboulay (reverted because the const qualifiers caused the function names to be mangled and therefore not found when using C linkage) and adds the const qualifiers where needed (i.e. before most pointers to read-only buffers) and marks functions in `*_c.cpp` files as `extern "C"` so the names don't get mangled.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1537e28a617f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.