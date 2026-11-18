# Issue

**Title:** Maintenance: pin macOS Apple Silicon CI runners to macos-15

## Description

## Why

GitHub rolled `macos-latest` from macOS 15 to macOS 26 (Apple Silicon) in late June 2026. The Xcode 26 linker no longer tolerates the `-U` flags that MATLAB R2023b to R2025a pass when linking C++ MEX files, so `spm_mesh_dist.cpp` fails to link:

```
Undefined symbols for architecture arm64:
  "_mexCreateMexFunction",  referenced from: <initial-undefines>
  "_mexDestroyMexFunction", referenced from: <initial-undefines>
  "_mexFunctionAdapter",    referenced from: <initial-undefines>
ld: symbol(s) not found for architecture arm64
make: *** [spm_mesh_dist.mexmaca64] Error 255
```

Only `.cpp` sources are affected. R2025b and later ship a fixed mex link configuration and build cleanly on macOS 26.

The rollout correlates exactly with the failures:

| Date | `macos-latest` image | R2024a result |
| --- | --- | --- |
| 2026-06-13 | `macos-15-arm64` (15.7.7) | success, 64 MEX files built |
| 2026-06-14 | `macos-15-arm64` | success |
| 2026-06-23 | `macos-26-arm64` | failure |
| 2026-07-01 onward | `macos-26-arm64` | failure on every run |

The staggered image rollout is why 23 and 27 June failed while the days in between passed.

Two workflows are affected:

* **`matlab.yml`**: R2023b, R2024a, R2024b and R2025a on `macos-latest` have failed on every nightly since late June (most recently [run 32095672043](https://github.com/spm/spm/actions/runs/32095672043)).
* **`compile_mex.yml`**: the `mexmaca64` job pins `macos-latest` with R2023b, which is exactly the broken combination. It has failed on every run since 2026-06-16 (last green 2026-06-12), so the shipped Apple Silicon MEX binaries have not been rebuilt since then.

## What changed

* `matlab.yml`: the Apple Silicon leg moves from `macos-latest` to `macos-15`, which is the image that was green on 2026-06-13. The seven "Apple Silicon version not available" excludes are retargeted accordingly. An `include:` block keeps R2025b and `latest` running on `macos-latest`, so macOS 26 stays covered where it works. The matrix grows from 40 to 42 jobs.
* `compile_mex.yml`: same pin for the `mexmaca64` job. Its comment claimed that only the MATLAB version matters for mex compatibility on Mac, which this failure disproves, so it has been corrected.
* `matlab.yml`: added `timeout-minutes: 120` to the test matrix job. In the run linked above, two ubuntu jobs hung for six hours inside `matlab-actions/setup-matlab@v2` with apt retry looping against an unreachable `azure.archive.ubuntu.com` mirror. That exhausted the 6 hour workflow limit and cancelled two unrelated sibling jobs. The value is sized from history: successful nightly jobs peak at 36 minutes, but one regression cron job legitimately took 82 minutes, so 120 leaves headroom while still capping a hang.

## Notes for the reviewer

* **CI on this PR does not prove the fix.** PR runs use the limited version set `["R2020a", "latest"]`, and on Apple Silicon that means only `latest` actually runs. The broken combinations (R2023b to R2025a) are nightly only. To verify before merging, trigger `matlab.yml` via `workflow_dispatch` on this branch, or merge and check the next nightly. `compile_mex.yml` will not run here either, since it only triggers on changes to source files.
* The evidence for `macos-15` being the right target is strong but inferred rather than measured: that exact image and MATLAB release built all 64 MEX files on 2026-06-13, and `macos-15-intel` still passes today.
* This buys time rather than solving the problem permanently. When `macos-15` is retired the same break returns for R2023b to R2025a. The durable options are dropping those releases from Apple Silicon coverage, or a Makefile level link workaround. Both are larger decisions than this change.
* `release.yml` and `install_test_standalone.yml` also use `macos-latest`, but both pin MATLAB `latest`, which builds fine on macOS 26. They are left untouched.
* Two other failures in the linked run are transient infrastructure, not code defects, and are not addressed here: an artifact service timeout on `R2022a / macos-15-intel`, and the apt mirror hang described above.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd9416e98888`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.