# Issue

**Title:** BUG: Release SyN metric global data after each update field

## Description

`ANTSImageRegistrationOptimizer::ComputeUpdateField` and `ComputeUpdateFieldAlternatingMin` call `df->GetGlobalDataPointer()` once per metric per iteration and never call `ReleaseGlobalDataPointer()`. Each call leaks one metric `GlobalDataStruct`, together with the neighborhood iterator it holds. This PR releases the struct when the update loop finishes. It is independent of #2056.

<details>
<summary>Behavior</summary>

For CC, MI, PR, and JTB, `ReleaseGlobalDataPointer` only deletes the struct. For MSQ (`SyNDemonsRegistrationFunction`) and the point-set metric, it also adds the per-run sums into `m_Metric` and `m_RMSChange`. Nothing in ANTs reads `GetMetric()` or `GetRMSChange()` on these functions, because convergence uses `GetEnergy()`, so registration output does not change. This matches how ITK's finite-difference solvers pair Get and Release.

</details>

<details>
<summary>Testing</summary>

All comparisons are between this commit on `main` (f53fd42b) and `main` itself.

**macOS 26 arm64, AppleClang, ITK 6, Release**

- `ctest`: 134/134 pass.
- `leaks --atExit` with `ANTS 2 -m <metric>[...] -t SyN[0.25] -r Gauss[3,0] -i 5x3`, for each of MSQ, CC, MI, and PR: 8 leaks on `main`, 0 on this branch.
- `ANTS fixed moving` (the two-image shortcut): 18 leaks on `main`, 13 on this branch. The remaining 13 are the argv allocations that #2056 fixes.
- Output: with `--number-of-affine-iterations 0`, `Warp`, `InverseWarp`, and `Affine.txt` are byte-identical to `main` for all four metrics, and so are the logs apart from the clock seed and the randomly sampled affine MMI value. The affine stage is disabled because it seeds from `time(nullptr)`, so two runs of `main` already differ from each other when it is on.

**Ubuntu 24.04 x86_64, GCC 13.3, ITK 6 (18d89fd6, the pinned commit)**

- Release and ASan+UBSan builds succeed, with the same warning counts as `main` (98 Release, 139 sanitizer).
- Release with `RUN_LONG_TESTS=ON`: 174/174 pass. ASan+UBSan with `halt_on_error`: 134/134 pass, with no sanitizer reports.
- LeakSanitizer, using the same commands as on macOS: 8 leaked allocations per SyN metric on `main`, none on this branch. The two-image shortcut has 18 on `main` and 13 on this branch. No `GetGlobalDataPointer` stack remains.
- Output: with the affine stage off, the warps and `Affine.txt` are byte-identical to `main` for MSQ, CC, MI, and PR. The logs match apart from the clock seed and the randomly sampled affine MMI value, which also differ between two runs of `main`.

</details>

<!--
provenance: claude-code session 2026-10-27
branch: hjmjohnson:bug-syn-globaldata-leak, commit aafbed70 on origin/main f53fd42b
related_files: ImageRegistration/itkANTSImageRegistrationOptimizer.cxx (two GetGlobalDataPointer sites, now released after each update loop)
related: #2056 (argv leak; together they should take the two-image ANTS path from 18 leaks to 0; the combination was not tested)
follow_up: .devlocal/hints/ants-affine-time-seed-nondeterminism.md
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f53fd42bb555`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.