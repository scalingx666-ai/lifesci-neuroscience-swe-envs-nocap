# Issue

**Title:** Remove nifti header builder

## Description

This removes the `NiftiHeaderBuilder` and the dependency `derive_builder`.
Reasons:
- It was not very useful, considering that we can build a default instance and work from there.
- Error handling isn't ideal, the error type is `String` which does not match how errors emerge from the rest of the crate, and I'm not sure if this would ever return an error, considering that all fields have a default value.
- The builder could leave the false impression that fields are validated when using it, which was never really the case.
- I could not just deprecate it because the implementation is behind a `derive` macro.

Hopefully there's no one relying heavily on this builder.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `560d026350b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.