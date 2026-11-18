# Issue

**Title:** Added a small try-catch statement for corrupted or empty NIfTI files and test

## Description

Added a try-catch block in the `isgz` function to capture scenarios when NIfTIs are corrupted or empty.

Added a test for this and an `empty.nii.gz` file.

Deleted NIfTI files that weren't being used in testing (the exact same files were in the `test/data` folder).

```
svisagan@Shakthis-Mac-mini NIfTI % cmp -l test/data/example4d.hdr.gz test/example4d.hdr.gz # no output 
svisagan@Shakthis-Mac-mini NIfTI % cmp -l test/data/example4d.img.gz test/example4d.img.gz # no output
svisagan@Shakthis-Mac-mini NIfTI % cmp -l test/data/example4d.nii.gz test/example4d.nii.gz # no output
```
(The above implies those files were the same. They were also not being used in the code anywhere).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad8e8222ef36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.