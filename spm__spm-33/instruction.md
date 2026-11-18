# Issue

**Title:** Test: add MATLAB R2024a

## Description

Changes:
- switch the matlab-actions/setup-matlab action conditionally between v1 and v2
- add MATLAB R2024a, which requires setup-matlab@v2
- Update GitHub action versions to the newest

Explanation:
MATLAB versions before R2021a and both R2022 versions need action v1
MATLAB before R2021a is not available with action v2
R2022 versions fail with some gifti read problem with action v2

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `367453ab96e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.