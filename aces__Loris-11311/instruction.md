# Issue

**Title:** [modules | timepoint_list] Backport (to 26.0-release) GHSA-3vv3-x7q8-46vr security fix

## Description

## What was wrong

The access check in the timepoint_list module allowed an authenticated user to access candidate timepoint information when the candidate was accessible to the user, without also requiring the appropriate Candidate module access permission.

This could allow users without frontend access to the Candidate module to directly access timepoint list pages by supplying candidate identifiers in the URL.

## What changed

Updated the timepoint_list access check so that access is granted only when the user either has `access_all_profiles`, or has both the `data_entry` permission and access to the requested candidate.

## Reference

Backport of the security fix addressing [GHSA-3vv3-x7q8-46vr](https://github.com/aces/Loris/security/advisories/GHSA-3vv3-x7q8-46vr).

This change is submitted specifically as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.