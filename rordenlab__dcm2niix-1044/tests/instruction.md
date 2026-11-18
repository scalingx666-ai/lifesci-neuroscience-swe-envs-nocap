# Issue

**Title:** Preserve macOS architecture lists in superbuild configuration

## Description

The superbuild forwards `CMAKE_OSX_ARCHITECTURES` directly through ExternalProject CMAKE_ARGS. A universal macOS architecture value such as `arm64;x86_64` contains CMake's list separator and can be split into separate arguments before reaching a child configuration.

Encode the architecture list once using `|`, then use ExternalProject's LIST_SEPARATOR to restore literal semicolons when invoking the console and four dependency configurations. Keep the five forwarding sites consistent. This targets `development` as required by the repository guidance.

Validation was limited to two synthetic configuration cases, each run once: `arm64` and `arm64;x86_64`. Both values reached all five local child configurations intact. The fixture used the actual source encoding and ExternalProject argument blocks with CMake's real configure machinery; child sources were empty language-NONE projects, and remote download/update, compilation, and installation were disabled. One whitespace check passed.

Existing source inspection and [CMake LIST_SEPARATOR documentation](https://cmake.org/cmake/help/latest/module/ExternalProject.html#miscellaneous-options) were reused. Per the explicitly requested scope, no dependency builds, DICOM conversion, dcm_qa corpus, codespell sweep, or broader checks were run. This establishes architecture argument forwarding, not a successful full universal build or universal compatibility of every optional dependency.

This is separate from #1043, which quotes the embedded Info.plist linker argument in console/CMakeLists.txt.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5beba99a3fdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.