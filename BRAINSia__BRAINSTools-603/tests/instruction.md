# Issue

**Title:** COMP: Allow bundled VTK to build under GCC 14

## Description

GCC 14 promotes implicit-function-declaration to a hard error. VTK's bundled hdf5 calls `vasprintf` (with `H5_HAVE_VASPRINTF` set but no `_GNU_SOURCE`), so it is implicitly declared and the build fails. This restores the pre-GCC-14 warning behavior for the VTK ExternalProject only; `vasprintf` still links correctly.

<details>
<summary>Context</summary>

Independent of the SuperBuild pin bumps. Needed to build VTK's bundled hdf5 on a GCC 14 toolchain (e.g. conda-forge gcc 14.3); harmless on older compilers.
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6595e24e5225`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.