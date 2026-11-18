# Issue

**Title:** BUG: Size the Siemens B-matrix buffer with resize, not reserve

## Description

`SiemensDWIConverter::ExtractBMatrix` called `reserve(6)` and then wrote through `&valueArray[0]` and read six elements. `reserve` leaves the size at zero, so every one of those accesses is undefined behavior that happens to work because the block is allocated. `resize(6)` gives the vector the elements the code uses.

<details>
<summary>Test</summary>

The defect is invisible in an ordinary Release build, so the new `SiemensBMatrixGTest` compiles `SiemensDWIConverter.cxx` into its own executable with hardened standard-library checks (`_GLIBCXX_ASSERTIONS` for libstdc++, `_LIBCPP_HARDENING_MODE_DEBUG` for libc++). It writes a minimal Siemens DICOM carrying private tag 0019|1027 with DCMTK, loads it through `DCMTKFileReader`, and calls `ExtractBMatrix` on the no-CSA path, which no existing fixture reaches.

Before the fix the test aborts on both toolchains:

- macOS, Apple clang / libc++: `libc++ Hardening assertion __n < size() failed: vector[] index out of bounds`
- Ubuntu 24.04, GCC 13.3 / libstdc++: `stl_vector.h:1128: operator[] ... Assertion '__n < this->size()' failed.`

After the fix it passes on both, and the 14 existing Siemens DWIConvert tests still pass.

Noticed while reviewing the CodeQL `cpp/rethrow-no-exception` site two lines below it (#627); CodeQL did not flag it.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Fable 5.1) found the defect during review and drafted the fix and the test; the test was run against the pre-fix code on both platforms to confirm it fails. The author reviewed the change and ran the tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e48f5014145`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.