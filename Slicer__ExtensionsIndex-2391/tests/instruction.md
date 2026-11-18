# Issue

**Title:** Change the name of the extension from SlicerDelineateLiverRT to SlicerDelineateLiverSIRT

## Description

This PR renames the extension from DelineateLiverRT to DelineateLiverSIRT to better reflect its clinical scope.

The current name (RT) is ambiguous and could be misinterpreted as referring to radiation therapy. SIRT (Selective Internal Radiation Therapy) accurately describes the treatment modality the extension is designed for.

Changes:
- DelineateLiverRT.json → DelineateLiverSIRT.json
- scm_url updated to the renamed GitLab repository

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eeb31240dda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.