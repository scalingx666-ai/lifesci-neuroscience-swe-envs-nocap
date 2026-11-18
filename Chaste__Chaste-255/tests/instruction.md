# Issue

**Title:** CI `libexpat1` downgrade

## Description

Short-term fix for CI to prevent `libexpat1` upgrade based CI failures (). 

This PR does not fix the underlying issue, but allows CI to pass by downgrading the package(s) on CI.

+ [x] Downgrade libexpat1 for github-hosted native ubuntu-22.04 workflows
+ ~Optionally Downgrade libexpat1 for container based workflows in jammy containers (not currently required, may be needed in the future if containers are updated)~. No longer needed due to changes to [Chaste/chaste-docker](https://github.com/Chaste/chaste-docker)
+ [x] Add nightly workflow to check for when the underlying issue is fixed for ubuntu 22.04 users. Once this workflow passes a comment will be left on #249 and the workflow disabled.
+ [x] `np3` is self hosted, @fcooper8472 is looking at downgrading and pinning libexpat1 there.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2ff7ee04e70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.