# Issue

**Title:** BUG: Drop explicit <double> template arg from std::abs in test (macOS SDK 26.5)

## Description

Fix a build break on **AppleClang 21 / macOS SDK 26.5** caused by `std::abs<double>(...)` becoming ambiguous against the new `<__math/abs.h>` overload set. Drop the explicit `<double>` template argument — the non-templated `std::abs(double)` overload resolves unambiguously and behavior is identical on older toolchains.

<details>
<summary>The exact error</summary>

```
BRAINSCommonLib/TestSuite/itkResampleInPlaceImageFilterTest.cxx:37:10: error: call to 'abs' is ambiguous
   37 |   return std::abs<double>(input - desired) > tolerance * std::abs<double>(desired);
      |          ^~~~~~~~~~~~~~~~
/Applications/Xcode.app/.../MacOSX26.5.sdk/usr/include/c++/v1/__math/abs.h:52:52: note: candidate function [with $0 = double]
/Applications/Xcode.app/.../MacOSX26.5.sdk/usr/include/c++/v1/__math/abs.h:57:53: note: candidate function [with $0 = double]
```

The explicit template-argument form was never load-bearing — inputs are plain `double`, so dropping `<double>` lets ordinary overload resolution pick `std::abs(double)` from `<cmath>` (or the `<__math/abs.h>` equivalent on newer libc++).

</details>

<details>
<summary>The fix</summary>

```diff
-  return std::abs<double>(input - desired) > tolerance * std::abs<double>(desired);
+  return std::abs(input - desired) > tolerance * std::abs(desired);
```

One file changed, +1/−1 line. No semantic change on any supported platform.

</details>

<details>
<summary>How this surfaced</summary>

Found while validating  (which migrates BRAINSTools's ANTs consumption from manual `include_directories` to `find_package(ANTS)`). The clean SuperBuild succeeded all the way through ITKv5 / SlicerExecutionModel / ANTs and into BRAINSTools-inner, then hit this single test file. The `find_package(ANTS)` machinery worked correctly — the `INTERFACE_INCLUDE_DIRECTORIES` from `ANTS::antsUtilities` flowed through to every `BRAINSCommonLib/*.o` compile line — but this pre-existing toolchain-incompatibility blocked the build from completing.

This fix is independent of #598 and can land first.

</details>

<!--
provenance: claude-code session 2026-05-12
unrelated_to_but_blocks: BRAINSia/BRAINSTools#598
toolchain: AppleClang 21.0.0.21000101 / macOS SDK 26.5 / libc++ <__math/abs.h>
file_changed: BRAINSCommonLib/TestSuite/itkResampleInPlaceImageFilterTest.cxx:37
diff_size: +1/-1
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67acae445449`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.