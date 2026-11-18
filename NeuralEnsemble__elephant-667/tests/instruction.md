# Issue

**Title:** [Fix] "too many resources requested for launch" error in the ASSET joint probability matrix computation when using CUDA

## Description

The computation of the joint probability matrix involves two GPU-accelerated steps. The two steps are invoked using the private classes `_PMatNeighbors` (first step) and `_JSFUniformOrderStat3D` (second step). With recent versions of PyCUDA (> 2021.1), the unit test for `_PMatNeighbors` failed with error

`pycuda._driver.LaunchError: cuLaunchKernel failed: too many resources requested for launch`

The number of registers used by the kernel in `_PMatNeighbors` is determined at run time, depending on the `n_largest` and `filter_size` parameters. Recent CUDA versions may produce compiled code that uses a larger number of registers. As the current behavior of `_PMatNeighbors` when using CUDA GPU acceleration is to utilize the maximum number of threads per block available on the GPU (typically 1024), this may exceed the maximum number of registers available when running with the maximum 1024 threads, raising that error. 

Therefore, this PR fixes the error by automatically determining the number of threads based on the number of registers in the compiled kernel.

To mirror functionality in `_JSFUniformOrderStat3D`, where the number of CUDA threads can be passed by a parameter to the ASSET function, additional functionality is implemented to allow overriding the number that was automatically determined. The `cuda_threads` parameter can also be passed as a tuple, where the second element will determine the number of threads used by `_PMatNeighbors`. If the usual single integer parameter value is passed, `_PMatNeighbors` will use the maximum number automatically determined.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `867a0fcb1039`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.