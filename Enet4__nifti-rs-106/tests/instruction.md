# Issue

**Title:** Feature/write complex valued data

## Description

Okay, here it goes:

- reads and writes RGB, RGBA, Complex64 and Complex128 now
- the new (additional) tests write RGB and RGBA using write_nifti
- I left the old write_rgb_nifti in place, but it can be removed

- I made a bit of a mess replacing LinearTransform with NiftiDataRescaler (I did not like the name LinearTransform), resulting in more code, but could clean this up more.

- For reading there is a function into_nifti_typed_data() now, which provides a vec of the native type, for when an ndarray is not needed/wanted
- resolves issue #105

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23c69a9456db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.