# Issue

**Title:** Tag Table: Add skeleton source as constraint

## Description

,  

Adds skeleton source controls to a skeleton source which is not registered. When empty, the table behaves just as before. When populated, the table only reflects labels, skeleton counts and label counts which are associated with those skeletons. All of that filtering is done by javascript on the cache populated on the first draw of the table, so it's pretty rapid too.

The ordering and filtering of the table should conserved when the skeleton source is changed (but not when refreshed, yet).

I also tidied up all of the IDs, switched completely to the datatables 1.10 API (it was previously a mixture), and made a few other changes which should make it more robust to future changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a40703209eec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.