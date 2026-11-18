# Issue

**Title:** Minor fixes aug2023

## Description

Hello all,

This PR is mostly minor stuff I've been accumulating locally. The only mildly noteworthy change is I've reworked aas_processBIDS to accept processing options via name/value pairs which I more or less copied from reproanalysis. I didn't (yet) remove the current use of acq_details because that would potentially break existing pipelines. Instead, I added a message that usage is depreciated so everyone can transition to passing name/values pairs at their own pace.

As always, happy to answer questions or address feedback.

Regards,
M

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `296ad508838d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.