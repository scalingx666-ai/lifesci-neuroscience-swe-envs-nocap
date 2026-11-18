# Issue

**Title:** Test vector reorient

## Description

`ants.apply_transforms` did not work with `imagetype=1`, because of problems with the pointer casting in ANTs. Unfortunately, this failure was hidden because the apply_transforms python function just returned a copy of the input. This is now changed such that an exception is raised if the C++ call exits with a nonzero status.

This also means that the build_template function was not working - the template deformable shape update was just not happening.

I added tests to check vector resampling and reorientation works now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f3a14b51881`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.