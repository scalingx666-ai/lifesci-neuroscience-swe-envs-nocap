# Issue

**Title:** Change defaults in header

## Description

As discussed in #41, some fields have more reasonable default values than the ones we currently have. Are there any other fields that we should look into? (`qform_code`/`sform_code`?)

- `pixdim`: `[1.;8]`
- `srow_x`: `[1, 0, 0, 0]`
- `srow_y`: `[0, 1, 0, 0]`
- `srow_z`: `[0, 0, 1, 0]`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `754e3ecc4f6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.