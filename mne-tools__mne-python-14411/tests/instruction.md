# Issue

**Title:** mailmap

## Description

I think `.mailmap` is supposed to be updated automatically these days, but in preparing a bib entry for a grant recently, an agent pointed out to me that there were some duplicates in the output of `git shortlog -nse`. This fixes them. If someone points me to the bit of automation that should have caught these, I can make the fix there instead. There are also two typo fixes for name spellings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e484b06ba766`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.