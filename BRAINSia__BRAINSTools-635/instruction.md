# Issue

**Title:** BUG: Replace bare rethrows in BRAINSABC with real exceptions

## Description

Twenty-four error paths in `BRAINSABC` used a bare `throw;` with no exception in flight, which calls `std::terminate`. Each now raises an `itk::ExceptionObject` whose message carries what the preceding `std::cout`/`std::cerr` lines printed (those prints are removed). Same defect class as #627, in the modules that CI does not build. The surrounding code is otherwise unchanged.

<details>
<summary>Sites</summary>

| File | Sites |
|---|---|
| `AtlasDefinition.h` | 15 in seven accessors (two per accessor, the second unreachable) and 1 in `Prior::GetBounds` |
| `AtlasDefinition.cxx` | `InitFromXML` (unreadable file, failed allocation, short read, parse error), `StrToD`, `StrToL`, unhandled XML element |
| `BRAINSABC.cxx` | atlas image type missing from the atlas XML |
| `BRAINSABCUtilities.cxx` | `ResampleInPlace` given a non-rigid transform |

A search of `BRAINSABC` finds no `throw;` outside a `catch` block.

This is the first of three small PRs split from the original version of this one. Follow-ups, both stacked on this branch: collapsing the duplicated lookups in `AtlasDefinition.h` into one helper, and reporting expat's error text and line number for malformed XML.

</details>

<details>
<summary>Tests</summary>

New `AtlasDefinitionGTest` (8 tests) writes small atlas XML files and checks all seven accessors on a missing tissue type, a missing modality, an unreadable file, malformed XML, a non-numeric weight, a non-numeric label code, and an unknown element. On the previous code seven of the eight terminate the process; the valid-atlas baseline passes on both.

Verified on macOS (Apple clang, libc++) and Ubuntu 24.04 (GCC 13.3, libstdc++): 8/8 on both. Three tests make an exception unwind out through expat's C callback frames, which the old code relied on but could never have exercised. Full suite on macOS Release: 537/537.

Not covered by a test: the missing-atlas-image-type check in `BRAINSABC.cxx` and the non-rigid `ResampleInPlace` check sit deep inside `main` and the registration pipeline, the failed-`new[]` check cannot be triggered, and a short read of a file that opened successfully is not triggerable in a test. `BRAINSABC` needs `USE_AutoWorkup` and `USE_ReferenceAtlas`, which the CI recipe turns off, so CI does not build these changes.

Found by CodeQL (`cpp/rethrow-no-exception`).

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Sonnet 5.5) drafted the fixes and tests from the CodeQL findings triaged earlier in this series; each test was run against the old code to confirm it fails. The author reviewed the change and ran the tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `182ad65a0aac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.