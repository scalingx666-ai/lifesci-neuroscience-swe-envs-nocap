# Issue

**Title:** Dockerfile refactor

## Description

Addresses  

- Dockerfile has been refactored to build in "stages" with abcd-hcp-pipeline built atop DCAN [internal-tools](https://github.com/DCAN-Labs/internal-tools) which is built atop [external-software](https://github.com/DCAN-Labs/external-software). This is in line with the build method already used for nhp-abcd-bids-pipeline and infant-abcd-bids-pipeline.  Estimated build time on Dockerhub (w/o build caching) is reduced by more than half.

- Matlab path vars in SetupEnv.sh changed to accommodate external-software.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2596af4796a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.