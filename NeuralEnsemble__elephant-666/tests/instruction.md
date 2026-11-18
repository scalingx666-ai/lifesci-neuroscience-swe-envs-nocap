# Issue

**Title:** [Fix] Failed ASSET GPU backend selection test when running in an environment with CUDA

## Description

The unit test `test_asset_choose_backend_opencl` failed when running in a system with a GPU and CUDA libraries available, generating the error

`AssertionError: 'cuda' != 'cpu'`.

Interestingly, the test failed with or without PyCUDA installed in the environment, which is not the expected behavior. In a system without PyCUDA or OpenCL, it should always use the CPU backend.

It was detected that the utility function for CUDA capabilities detection `utils.get_cuda_capability_major` used the CUDA libraries in the system directly, which returns valid capabilities regardless of the availability of PyCUDA. The latter is required by the functions in ASSET when running CUDA GPU code. Therefore, the first fix in this PR modifies the function to return zero if PyCUDA is not available. It then uses PyCUDA instead of the libraries to detect if a GPU is available and accessible to use with the ASSET function.

This was the behavior enforced when setting flags for the tests in `test_asset.py`. Therefore, the flags are now set to use the utility functions.

Finally, the failed `test_asset_choose_backend_opencl` was implemented as a regression test to check the conditions where no GPU was available and no environmental variable flags were set, which in the past resulted in trying to use the OpenCL backend instead of the CPU. Therefore, in a CI runner with GPU/CUDA, the test is not intended to run, as the default behavior in Elephant is to use the CUDA GPU acceleration and, hence, the backend selection returned `'cuda'` correctly. Therefore, the second fix in the PR conditions the test execution on not having PyCUDA and a GPU.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ab5b208d909`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.