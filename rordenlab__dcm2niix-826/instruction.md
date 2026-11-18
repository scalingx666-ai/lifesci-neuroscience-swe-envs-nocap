# Issue

**Title:** add MAGNITUDE to ImageType for GE data

## Description

That change is necessary for heudiconv logic in `heudiconv.convert.update_complex_name` triggering `RuntimeError("Data type could not be inferred from the metadata.")`.

https://github.com/nipy/heudiconv/blob/68231ef2dc9bfc603c2f925c3ec00c98dd6681b4/heudiconv/convert.py#L334-L340

Otherwise, it would require heudiconv to assume `MAGNITUDE`  by default, while we reliably have that information from the dicoms at the conversion stage.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9ad69e2cacd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.