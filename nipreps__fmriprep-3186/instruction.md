# Issue

**Title:** ENH: Allow --ignore fmap-jacobian to disable Jacobian determinant modulation during fieldmap correction

## Description

There is some indication () that fieldmap correction can lead to weird patches of intensity variation. This is almost certainly caused to modulation by the Jacobian determinant image, although the reason that this is not working as expected in these cases is unclear.

In any case, this allows the behavior to be disabled with `--ignore fmap-jacobian`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f4b302ab916`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.