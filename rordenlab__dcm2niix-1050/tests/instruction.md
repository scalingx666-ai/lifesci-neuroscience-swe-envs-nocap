# Issue

**Title:** Preserve non-MSVC OpenJPEG configuration flags

## Description

The OpenJPEG superbuild currently passes empty `CMAKE_C_FLAGS_RELEASE` and `CMAKE_C_FLAGS_DEBUG` settings outside MSVC, overriding both CMake defaults and flags supplied to the parent build.

Forward the parent's configuration-specific C flags in that branch. The existing MSVC runtime flags and static-library configuration remain unchanged, and intentionally empty caller values remain empty.

Validation completed locally: reproduced the original Release flag mismatch; checked the corrected parent/generated/child cache values; compiled the real OpenJPEG 2.5.3 `openjp2` static target with GCC; checked Debug, custom and explicitly empty flag configurations. The normal full-history dependency download ran out of disk space, so the child build used a shallow clone of the same pinned release and the generated configure arguments.

The full converter/deployment build, required `dcm_qa` and tracked-file codespell checks, and native macOS/Windows builds remain outstanding. No conversion-output or benchmark claim is made.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b5765e551d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.