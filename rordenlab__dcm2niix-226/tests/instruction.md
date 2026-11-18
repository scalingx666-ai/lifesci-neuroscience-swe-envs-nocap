# Issue

**Title:** Changes from divest, up to version 0.6.1

## Description

Some unobtrusive changes from across recent versions of `divest`, so as to keep the two code-bases in line: a change in the fencing marker for R (`HAVE_R` -> `USING_R`, since the latter is defined by R itself), and some adjustments to work around compiler and `valgrind` warnings – the latter due to a fairly heavy stack allocation, which I avoid.

I think the continuous integration is currently failing on the `master` branch of `dcm2niix`, so it will fail here too, but I don't see any additional failures [on Travis](https://travis-ci.org/jonclayden/divest/jobs/429532537).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb05c3a7409f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.