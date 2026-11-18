# Issue

**Title:** Bump compiler version in CI

## Description

Bump gcc-9 -> gcc-10, gcc-10 -> gcc-12.
Fixes CI failures caused by 
Note that NEURON still supports GCC 9, but as time goes on, it will get increasingly more difficult to get it, and we mandate GCC 10 for wheels anyway.

~~Also download NSIS from wherever `choco` fetches it from, since SourceForge started using CloudFlare and now downloading the installer via CLI is impossible, which fixes the Windows CI.~~ Intermittent issue it seems

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `718ca0ceff29`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.