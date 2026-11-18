# Issue

**Title:** Fix Spade compile issue

## Description

### Desc
Current Spade source code uses an experimental method `std::experimental::erase_if` which has been added as a standard library method in c++20. However spade src code is currently compiled with only c++17 causing newer runners such as macos-latest and windows-latest on github to fail as they deprecated the c++ library that contained the experimental methods.

Several other compiler warnings also came up with clang during this fix.

This will resolve issue #689 

### Changes

**C++ fixes in `spade_src`:**
- Replaced `std::experimental::erase_if` with an erase-remove idiom in `FPGrowth.h`, keeping the code compliant with C++17
- Replaced `high_resolution_clock` with `system_clock` uniformly across all platforms in `Timer.h`, `high_resolution_clock`  is just an alias that resolves to `steady_clock` or `system_clock`, unfortunately on macOS it resolves to `steady_clock` which lacks `to_time_t` method, causing a compilation error
- Added a `return 0` fallback in `Utils.h` as a no-op for the macOS branch of `GetCurrentRSS` to fix a `-Wreturn-type` clang warning
- Extended the `-Wmissing-field-initializers` pragma suppression in `fim.cpp` to cover clang as well
- Added pragma suppression for `-Wunused-private-field` warning around `m_size` attribute in `ClosedDetect.h`

**`setup.py` fixes:**
- Fixed OpenMP flag for Windows: `-fopenmp` to `-openmp` (MSVC syntax)
- Added `"Darwin"` to the platforms that include the `fim` extension module, so macOS builds now compile the C extension

**CI (`build_wheels.yml`):**
- Added `macos-15-intel` runner to the matrix to cover x86 builds alongside the arm64 runner (`macos-latest`)
- Fixed OpenMP discovery on macOS by using brew to dynamically get omp library paths during compile
- Set `MACOSX_DEPLOYMENT_TARGET` conditionally per architecture: `15.0` for ARM64, `14.0` for Intel
- Removed separate macOS and Linux+Windows split, now using a single build wheel task
- Added a post-build verification step that installs the built wheel and checks if compiled fim*.so is available.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `645a1fa743db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.