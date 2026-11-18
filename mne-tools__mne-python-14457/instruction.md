# Issue

**Title:** BUG: Fix picks_artifact passed as exclude in regress_artifact

## Description

#### What does this implement/fix?

There seems to have been a slipup in the regression code when you passed in already computed betas. The issue was that `picks_artifact` was passed positionally and actually ended up in the `exclude` variable. To fix, I changed the buggy version for the same call as in the non-beta version.

#### Additional information

I fixed the code myself and used `qwen3.8-flash-next-IQ3_S` to create the pytest. The test was manually reviewed and the before and after results were compared.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f348177da52f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.