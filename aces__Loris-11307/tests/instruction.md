# Issue

**Title:** [modules | api] Backport (to 26.0-release) imaging browser API access check security fix (GHSA-m48r-jv24-jjcx)

## Description

## What was wrong

The Imaging Browser API endpoint did not properly enforce the access checks required for modifying imaging QC data.

This could allow users to modify imaging QC data through the API without the required permission and project access restrictions.

## What changed

Added authorization checks to the Imaging Browser API endpoint to ensure that users can only modify imaging QC data when they have the appropriate Imaging Browser permission and access to the project associated with the visit.

Unauthorized requests should now be rejected.

## Reference

Backport of the upstream security fix addressing [[GHSA-m48r-jv24-jjcx](https://github.com/aces/Loris/security/advisories/GHSA-m48r-jv24-jjcx)].

This change is submitted specifically as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.