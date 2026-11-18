# Issue

**Title:** added support for Bool datatype #38

## Description

Add support for Bool datatype #38 
Testcase for Array{Bool} and BitArray
Bump version to 0.4.1
Fix of one error message
Change of one warn() to println (warn() not supported anymore)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35a34cf4bd21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.