# Issue

**Title:** BF: provide full URLs to github for submodules

## Description

Unfortunately ATM DataLad does not do any magic/custom discovery
for sub-dataset URLs whenever they come from "flattened" list
as on GitHub.  So if GitHub is intended to be original source,
you would need to provide full URLs. It should though work ok
even if this hierarchy would get published somewhere as a hierarchy
(e.g. http://datasets.datalad.org) since git itself does first
attempt to clone from "father" git URL + submodule path and only
if fails then goes after url in .gitmodules

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6e3b6181d64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.