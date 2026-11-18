# Issue

**Title:** Fix build ensuring expected compiler is used

## Description

This ensures the project and its dependency are build using the expected compiler.

With this set of changes, the IGSIO project now build on the Slicer build machine where we explicitly set `CC` and `CXX` variables to `/dev/null` and ensure the same compiler is used across all projects.

It fixes the following error:

```
...
[ 18%] Performing update step for 'openjpeg'
HEAD is now at de02746b Set visibility to hidden for GCC static building.
[ 25%] No patch step for 'openjpeg'
[ 31%] Performing configure step for 'openjpeg'
Not searching for unused variables given on the command line.
-- The C compiler identification is unknown
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - failed
-- Check for working C compiler: /dev/null
-- Check for working C compiler: /dev/null - broken
...
```

_Source: https://slicer.cdash.org/viewBuildError.php?buildid=3001453_


References:
* 
* https://discourse.slicer.org/t/transition-of-macos-preview-build-from-host-10-13-high-sierra-to-13-ventura/28668/3?u=jcfr

cc: @sjh26 @Sunderlandkyl

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c1e2b9e8ad6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.