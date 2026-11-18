# Issue

**Title:** Forward the selected macOS SDK to superbuild projects

## Description

The superbuild forwards macOS architecture and deployment-target settings but omits the explicitly selected `CMAKE_OSX_SYSROOT`. Child projects can therefore choose their own default SDK instead of the one selected by the parent configuration.

Add only five quoted CMAKE_OSX_SYSROOT arguments: one for the console and one for each of the four dependency projects. The PR targets development.

Validation was limited to one synthetic SDK-directory path containing spaces, run once through real CMake ExternalProject configure steps. All five local language-NONE child projects received the exact selected path. The fixture used the actual source CMAKE_ARGS blocks with remote download/update, compilation and installation disabled. One whitespace check passed.

The architecture receipts and fixture structure from #1044 were reused without rerunning its architecture cases. Existing source inspection and [CMake SDK documentation](https://cmake.org/cmake/help/latest/variable/CMAKE_OSX_SYSROOT.html) were reused. Per the explicit validation scope, no SDK-content verification, dependency builds, image conversion, dcm_qa corpus, codespell sweep, or broader checks were run. This establishes SDK argument forwarding, not a successful build against a particular SDK.

This is distinct from #1044's architecture-list preservation and #1043's linker-path quoting. Retain the independent settings when integrating.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5beba99a3fdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.