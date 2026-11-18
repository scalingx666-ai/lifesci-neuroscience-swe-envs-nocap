# Issue

**Title:** CI: Migrate unit tests from CircleCI into GHA

## Description

## Summary
- replace CircleCI test job with wrapper_smoke
- keep only Python 3 wrapper smoke checks (smriprep-docker --help/--version)
- remove CircleCI pytest, test-data, templateflow, and codecov steps from this job
- update workflow wiring so wrapper_smoke requires only build
- set branch filters for wrapper_smoke to ignore docs/, tests/, ds005/, and ds054/ branches

## Validation
- YAML parse check passed for .circleci/config.yml

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11bee2c9620c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.