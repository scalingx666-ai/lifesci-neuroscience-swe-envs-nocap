# Issue

**Title:** [ENH] Improved output messages/status information of ASSET functions

## Description

This PR replaces ordinary `print` statements throughout ASSET with `logging` calls. 

Moreover, steps that use loops also have improved output by using `tqdm` progress bars. 

Any INFO logging is controlled by the usual `verbose` parameter in the functions. Moreover, the user can use the standard log level setting to enable specific messages, as DEBUG messages were also included.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a07224d099d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.