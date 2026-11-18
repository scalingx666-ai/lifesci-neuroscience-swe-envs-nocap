# Issue

**Title:** from_numpy type conversion

## Description

Related to issue #921

- Centralize supported types, conversion maps, and native type abbreviations in core/_pixel_types.py.

- Add pixeltype to from_numpy, accepting ITK and NumPy type names. Preserve the existing automatic float64-to-float32 conversion unless double precision is explicitly requested.

- Convert 8-bit and 16-bit signed numpy ints to float32 instead of uint32. This is what `read_image` does for images read from disk.

My initial goal for this PR was to enable wider use of lossless conversion on import with from_numpy, and to allow float64 precision in ANTsImage operations. But I don't think that's really feasible, we can keep float64 storage but a lot of algorithms rely on float32, and it seems not worth the effort to retain float64 storage of computations at float32 precision.

I have come across several instances where input data types are not checked before sending image pointers to C++ code. I'll address these in a separate PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01a50724d8db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.