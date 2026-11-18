# Issue

**Title:** Clearswi

## Description

Hi Kwok,
I finally got the time to add CLEAR-SWI. Thanks for preparing the framework so nicely!

Since ROMEO and CLEAR-SWI are compiled together in the same package, I changed ROMEO_HOME to MRITOOLS_HOME. If that would introduce unwanted breaking changes or might be confusing, we can also keep it as ROMEO_HOME and just call CLEAR-SWI from ROMEO_HOME.

Best,
Korbinian

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ff5c76191c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.