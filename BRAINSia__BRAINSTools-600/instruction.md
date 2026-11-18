# Issue

**Title:** BUG: Drop explicit <double> template arg from std::abs in test

## Description

Drop the explicit `<double>` template argument from `std::abs` in `itkResampleInPlaceImageFilterTest.cxx`, which became ambiguous on macOS SDK 26.5 / AppleClang 21 and broke the test build.

<details>
<summary>Root cause</summary>

macOS SDK 26.5's libc++ exposes the `std::abs` overload set via `<__math/abs.h>`, where the `int` / `long` / `long long` overloads plus the floating-point template are all visible. Writing `std::abs<double>(...)` forces template-argument deduction and leaves the integer candidates viable, so overload resolution is ambiguous:

```
error: call to 'abs' is ambiguous
   return std::abs<double>(input - desired) > tolerance * std::abs<double>(desired);
          ^~~~~~~~~~~~~~~~
note: candidate function [with $0 = double]  inline int       abs(int)
note: candidate function [with $0 = double]  inline long      abs(long)
note: candidate function [with $0 = double]  inline long long abs(long long)
```

The explicit template argument was never load-bearing: the inputs are `double`, so the non-template `std::abs(double)` from `<cmath>` is an exact match and resolves unambiguously. Dropping `<double>` fixes the build on current Apple toolchains with no behavior change on earlier SDKs or other platforms.

Surfaced while validating BRAINSia/BRAINSTools#598 (find_package(ANTS) migration) on AppleClang 21 / macOS SDK 26.5.

</details>

<details>
<summary>Local validation</summary>

Verified on the exact toolchain that surfaced the bug (Apple clang 21.0.0, arm64-apple-darwin25.5.0), compiling via `ccache clang++ -std=c++17`:

- Pre-fix form `std::abs<double>(...)` → `error: call to 'abs' is ambiguous` (candidates from MacOSX.sdk `<__math/abs.h>`).
- This branch's form `std::abs(...)` → compiles cleanly (exit 0).

`pre-commit run --all-files` passes.

</details>

<!--
provenance: claude-code session 2026-05-22
file: BRAINSCommonLib/TestSuite/itkResampleInPlaceImageFilterTest.cxx:37
verify: standalone TU repro on AppleClang 21 / SDK 26.5; ccache launcher; broken=ambiguous, fixed=exit0
related: BRAINSia/BRAINSTools#598 (find_package(ANTS) migration)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6595e24e5225`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.