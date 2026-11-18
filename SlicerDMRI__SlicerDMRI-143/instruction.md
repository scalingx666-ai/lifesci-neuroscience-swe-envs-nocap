# Issue

**Title:** Fixed vendor name bug and removed erroneous tags

## Description

Previous code always assigned "Philips" as vendor if any tags for any vendor
matched. Also removed two tags which matched non-DWI Siemens volume.
Those tags were left as comments in case someone in the future wants to treat
those with more nuance and put them back in. Adjusted loadable tooltip to
list all matching vendors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f91fc835fd7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.