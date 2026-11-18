# Issue

**Title:** [DOC] update doc

## Description

-  
- switch to using the latest distro / software versions in examples
- try to only show examples that are known to build
- comment out section of the doc that are not relevant given the build failure status of some softwares
- test the build of some of the examples
- leave out nipype example out of the doc until fixed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5e80941f35a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.