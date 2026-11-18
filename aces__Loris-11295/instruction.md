# Issue

**Title:** [php | libraries | FeedbackMRI Class] Backport (to 26.0-release) MRI feedback SQL injection fix (GHSA-9r29-6jgc-3ggh)

## Description

## What was wrong

The MRI feedback popup used SQL queries constructed by directly interpolating file or session identifiers into the SQL WHERE clause.

This could allow an attacker to manipulate the SQL query and potentially access or alter data.

## What changed

- Removed the _buildWhere() method that constructed SQL conditions using direct string interpolation.
- Updated the query to use named SQL parameters for FileID and SessionID.
- Passed the corresponding values through _buildWhereAssoc() to use parameterized database queries.

## Reference

Backport security fix addressing [GHSA-9r29-6jgc-3ggh](https://github.com/aces/Loris/security/advisories/GHSA-9r29-6jgc-3ggh).

This change is submitted specifically as a security backport to the 26.0-release branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.