# Issue

**Title:** Set uipanel property based on MATLAB version

## Description

Conditionally set uipanel property to `ShadowColor` if R2022b (9.13) or older, and `BorderColor` otherwise (9.14 or newer). Tested with MATLAB R2022a on Debian 13 "Trixie"  (kernel 6.17.8)   
  
Comments:
1. MATLAB versions can be checked using various built-ins but a) `ver` is too verbose, b) `verLessThan` is not advised since R2023b and c) `ismatlabreleaseolderthan` was only introduced since R2020b. For max compatibility, `spm_check_version` is currently used. Alternatively just `version` could be used, but the spm wrapper does additional checks.
2. MATLAB versions do not appear to be tabulated on Mathworks, but a good mapping of releases to versions can be found on Wikipedia:
https://en.wikipedia.org/wiki/MATLAB#Release_history

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25bd9cf474a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.