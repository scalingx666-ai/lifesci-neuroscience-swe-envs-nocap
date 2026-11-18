# Issue

**Title:** [math] Add new customize operators with `cupy`

## Description

Although we can now use the flexible taichi custom operator approach, taichi on cuda does not have more fine-grained control or optimization for some scenarios. So for such scenarios, we can use cupy's `RawModule`(https://docs.cupy.dev/en/stable/user_guide/kernel.html#raw-kernels) or `jit.rawkernel`(https://docs.cupy.dev/en/stable/user_guide/kernel.html#jit-kernel-definition) to compile and run CUDA native code directly as strings in real time for finer grained control.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23b5ab957b64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.