# Issue

**Title:** [DataTable] Re-add fix to multiselects with commas to V27

## Description

## Brief summary of changes
Adds back changes from  that weren't brought over to Loris 27. Fixes filtering for multiselects that contained options with commas

#### Testing instructions (if applicable)

1. In a multiselect filter that contains options with commas and see that the corresponding data appear in the table

#### Link(s) to related issue(s)

* On CCNA: Resolves #

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `936aedd041be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.