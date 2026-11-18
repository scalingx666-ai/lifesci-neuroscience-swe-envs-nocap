# Issue

**Title:** UX: Warn when subdataset-source-candidate uses non-3-digit cost prefix

## Description

Previously, if a user specified datalad.get.subdataset-source-candidate-* with 1, 2, or 4+ leading digits (e.g., "40myserver" instead of "040myserver"), the digits were silently ignored and default cost 700 was used.

Now a warning is issued explaining that exactly 3 digits are required, with a suggestion for the correct format (padding or truncating as needed).

- Extract _parse_source_candidate_name() helper for parsing and validation
- Add parametric tests covering valid costs, no digits, and invalid digit counts
- Originally reported by @just-meng 

In principle we could even turn it into an error or allow arbitrarily long numbers. This PR should not change behavior, just warn user that we ignore that setting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce64c3367623`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.