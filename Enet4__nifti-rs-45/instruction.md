# Issue

**Title:** Signal inter

## Description

Updated docs, defaulted SI and removed SI management. It "fixes" #28, kind-of, but you might want to keep it open or to create a new and better explained task :) It makes `write_nifti` and `write_rgb_nifti` more alike, which is good if we want to merge them.

Btw, do you plan to do a release someday? We are interested in all the "writer" stuff, of course!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d7c909e12ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.