# Issue

**Title:** Fixing doc builds

## Description

This is a fix for recent failure of doc builds on readthedocs. Though the precise cause of the failure was not determined, there seemed to be an internal issue within `pip` while setting up the RTD environment. This fix addresses this issue by (i) not installing pip within the RTD environment file and (ii) not installing the Elephant requirements.txt file from within this environment. Both of these steps are not required (Elephant requirements are installed during installation).

In addition, an error in the temporary installation of viziphant was fixed, but moving the pip install of viziphant to the `environment.yml` file. At the same time, neo installation was moved there explicitly as long as elephant requires `neo==0.9.0`.

Version number was bumped to 0.10.1 to avoid conflicts in installing through viziphant.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c388e49f949`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.