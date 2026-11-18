# Issue

**Title:** Fix bug: error in last module not stopping

## Description

When an error occurs in the last module, aa did not stop. To solve I check whether current module is last module, and then set watforalljobs = true. This could also be achieved by setting waitforalljobs = true when aaq_qsub.run_all() is called.

I have also removed some superfluous code that was changing waitforjobs back to false unnecessarily. This is no longer needed because of the way I use obj,jobinfo to check for the existence of jobs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33ade008b49b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.