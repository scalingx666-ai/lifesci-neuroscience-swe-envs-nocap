# Issue

**Title:** Update libs

## Description

With ndarray ecosystem (npy and stats) ready for 0.15, we might as well update too. I updated `pretty_assertions`, `nalgebra`+`simba` and `ndarray`. There was no specific fix or problem with those libs. And I don't think think we should update the code related to the first three. However, maybe we could update nifti-rs to actually use some of ndarray 0.15 new features, but I don't know this library precisely enough to know where to look. Maybe the best is to wait until we do have a real task and then use what's new.

I didn't update the minimum rust version because it doesn't exist in this library. It's now at Rust 1.49.

As always, if there's nothing in the near-future to change, my colleagues and me would appreciate a release with these changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4606d4413999`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.