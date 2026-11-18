# Issue

**Title:** Fix Brainflow contributors in papers.bib

## Description

[Part of JOSS review at: 

Apologies, but I just realized that #456 introduced a small error: the Brainflow contributors were interpreted as a name, i.e. as "contributors, B.". This PR should fix this, giving the expected reference/citation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f5d05473f991`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.