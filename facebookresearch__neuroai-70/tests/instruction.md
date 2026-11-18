# Issue

**Title:** Seed before neuralbench model construction

## Description

## Summary
- seed at the start of \ so model construction does not depend on prior RNG consumption
- keep the existing post-build reseed so training RNG stays decoupled from model-build RNG usage
- add a regression test and a standalone reproduction script for the wrapper/adapter/lazy-init path

## Why
In this codepath, "encoder only" does not mean model construction is RNG-free. RNG is still consumed by lazy-layer materialization, random channel-adapter initialization, and downstream wrapper probe construction. Seeding only after \ lets those parameters vary with earlier RNG usage such as data preparation.

## Verification
- \.                                                                        [100%]
1 passed in 8.84s
- \Late seeding digests:
  pre_draws=0  -> 52bfaf80b8aa8fc7
  pre_draws=64 -> e83d6513766c0cc0
Early seeding digests:
  pre_draws=0  -> 6898bd8e07026441
  pre_draws=64 -> 6898bd8e07026441
Reproduction succeeded: only early seeding is invariant to prior RNG usage.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06a4d37400c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.