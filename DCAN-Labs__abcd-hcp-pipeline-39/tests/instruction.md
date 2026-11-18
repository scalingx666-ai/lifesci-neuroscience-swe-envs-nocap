# Issue

**Title:** Support for ExecutiveSummary >= v2.2.10, dcan_bold_processing >= v4.0.7

## Description

- get_fmriname, get_taskname functions in helpers.py updated to be consistent with abcd-nhp-bids-pipeline and infant-abcd-bids-pipeline
- update pipelines.py for compatibility with current version of ExecutiveSummary (v2.2.10)
- Update ExecutiveSummary to v2.2.10
- Update dcan_bold_processing to v4.0.8
- Add progress toward phase/mag fmap support from iss32 branch

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c4a09425ab7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.