# Issue

**Title:** COMP: Bump VTK SuperBuild pin to slicer-v9.6.2

## Description

Bump the VTK SuperBuild pin: `slicer-v9.6.1` → `slicer-v9.6.2`. Builds cleanly against current ITK on a GCC 14 toolchain.

> On GCC 14, building this VTK also needs the implicit-function-declaration fix in #603.

<details>
<summary>Scope change</summary>

Originally also bumped the ANTs pin, but `main` since repointed ANTs to the `hjmjohnson/ANTs` `antsconfig-cmake-modernize` branch (`find_package(ANTS)` refactor, ANTsX/ANTs#1973). Rebased to drop the ANTs change and keep only the VTK 9.6.2 bump.
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c656fe2461f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.