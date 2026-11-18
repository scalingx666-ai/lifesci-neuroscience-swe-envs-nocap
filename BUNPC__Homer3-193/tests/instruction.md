# Issue

**Title:** Critical bug fix SplineSG mlAct

## Description

* SplineSG has mlActAuto as an input. Due to the changes in homer3, mlActAuto contains only the first wavelength. SplineSG thus failed to clean the data from the second wavelength. 
      Note for homer2 users: This was working properly for homer2. 
      Note for homer3 users: Please reconsider running your pipeline with this version and up.
* Cleaned up code -> now no warning re filter parameters empty.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `592b270703aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.