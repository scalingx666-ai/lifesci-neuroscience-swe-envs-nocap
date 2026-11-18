# Issue

**Title:** ENH: cmake - pass C and CXX _FLAGS and VERBOSE to console subproj

## Description

`console` module is pretty much **the** project.  So in my opinion those flags should be passed into it.  Also I did spend some time trying to figure out whytf my `make VERBOSE=1` was not in "effect" ;-)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e492c307687d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.