# Issue

**Title:** Bugfix: circumvent MemoryError that occurs when the number of samples…

## Description

… (npts) is very large.

When trying to import hypnograms in the stage-duration format, I am running out of memory on a 16 GB RAM machine as the (transiently) created array `index` in `hypno_time_to_sample` becomes extremely large. As `index` is collapsed in one dimension right in the next line, I just substituted the relevant lines with a for loop that computes the collapsed array in one go. This is probably even faster than the version with (the arguably more elegant) broadcasting as the allocation for the broadcasted array will eat a lot of time; however, I haven't timed it (just noticed a faster startup of `Sleep.show()` even for small files).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94664d73d65e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.