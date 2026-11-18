# Issue

**Title:** Edit nifti header to reflect custom RepetitionTime

## Description

Getting TR right in bids is super annoying. See this thread: 

https://groups.google.com/forum/#!topic/bids-discussion/jPVb-4Ah29A

Anyway, this is just a little tweak to better handle custom TRs by updating not just the sidecar (which we already support with the customHeader field in the description) but also the nifti header.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29dba4393637`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.