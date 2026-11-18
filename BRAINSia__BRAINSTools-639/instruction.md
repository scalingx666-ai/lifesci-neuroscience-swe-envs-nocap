# Issue

**Title:** COMP: Build ITK in CI with the portable arch flags, not -march=native

## Description

CI built ITK with `-mtune=native -march=native` even though the workflow sets a portable `arch_flags` (`-march=x86-64-v3`, `-mcpu=apple-m1`). ITK's flags come after `CMAKE_CXX_FLAGS` on the compile line and win, so ITK and its vendored libraries were compiled for whichever CPU the runner had, and ccache then handed those objects to other runners. The workflow now passes `arch_flags` as `BRAINSToools_C_OPTIMIZATION_FLAGS` and `BRAINSToools_CXX_OPTIMIZATION_FLAGS`, and a new step fails the job if ITK's cache still holds a host-specific flag. Fixes the CI half of #630; whether the default itself should change is tracked in #638.

<details>
<summary>The failure this removes</summary>

The failing Ubuntu jobs on #635-#637 died after 4-7 minutes with `FAILED: [code=132] bin/H5detect` (`SIGILL`) inside ITK's HDF5 build. Their link line was:

```
gcc -std=c99 -march=x86-64-v3 -mtune=generic  -mtune=native -march=native ...
```

The job restored a ccache with a 99.98% hit rate (5286 of 5287), so every object, including `H5detect`, came from a runner with a newer CPU. The workflow saves the cache even when the job fails, so each failed run re-saved the same objects, and a rerun restored them again. On a runner with AVX512-FP16 the same flag instead selects Eigen's FP16 packet math, which does not compile with GCC 13 (#630).

</details>

<details>
<summary>Why no cache-key bump</summary>

ccache hashes the compiler arguments, so ITK's objects built with the old flags stop matching once the flags change. Objects for the BRAINSTools inner build, VTK, and ANTs were built with `x86-64-v3` only and stay valid, so the key prefix is unchanged and those entries keep hitting. The stale ITK entries age out under the existing `--evict-older-than 60d`.

</details>

<details>
<summary>Verification</summary>

- Configured the SuperBuild locally with CI-style arguments. Without the two new variables, `ITKv5-cache-Release.cmake` contained `ITK_CXX_OPTIMIZATION_FLAGS " -mtune=native -march=native"`; with them it contained `"-mcpu=apple-m1"` (the macOS matrix value), and likewise for the C flags.
- Ran the new guard's shell logic on a real ITK cache with the default flags (it fails, as intended) and on one holding `-march=x86-64-v3 -mtune=generic` (it passes).
- The workflow YAML parses.
- The new step cannot be exercised before CI runs; its first real run is this PR's own Ubuntu and macOS jobs.

`x86-64-v3` needs AVX2, which every GitHub-hosted `ubuntu-latest` x86-64 runner provides, as the existing matrix comment notes. An arm64 Linux runner would need its own `arch_flags` entry.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Sonnet 5.5) traced the flag path from the failing job's link line through `Common.cmake` and `External_ITKv5.cmake`, drafted the change, and ran the local checks. The author reviewed the change.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d30412181c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.