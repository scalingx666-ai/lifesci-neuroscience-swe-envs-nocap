# Issue

**Title:** fix: Respect label order in precomputed derivatives

## Description

`BIDSLayout` does a `natural_sort` on all `get()` query results, which breaks ordering encoded in the query itself. This PR looks for the label entity in the query and re-sorts by the label list to ensure that values are returned as expected.

A more robust refactor might either carry around a list of tissue labels or re-order probsegs, but doing that right would be a nontrivial effort, and introduce opportunities for new bugs. This narrowly targets a known bug.

This is a bug-fix candidate PR.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5292c7b3bd05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.