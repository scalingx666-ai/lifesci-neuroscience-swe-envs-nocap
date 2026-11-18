# Issue

**Title:** Fix small corner-case bug with moments

## Description

We have special casing for `z=0` in the maxwell filtering code that is incorrect. It's correct that those terms are zero only for order 1. Refactor code to fix this, and assert that the bases agree when exactly on z=0 and slightly off of it (which fails on `main`).

This is a tiny corner-case since it relies on exact equality to hit, so I'll self-mark for merge-when-green. I found this while investigating #14332 and trying to add spheroidal bases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f41c1aec55c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.