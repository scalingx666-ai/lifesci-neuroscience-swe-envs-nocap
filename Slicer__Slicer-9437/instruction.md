# Issue

**Title:** BUG: Hide std::regex internals in Slicer libraries

## Description

:robot: AI generated PR description:

Linux tests started crashing during file loading after #9421 introduced some `std::regex` calls. Slicer’s regex helpers can resolve to symbols exported by the bundled Qt WebEngine, which was built with the legacy `std::string` ABI. This mixes incompatible implementations and causes the crash.

This extends the protection added for VTK in #9231 to Slicer’s own libraries, modules, and executables. The linker version script is moved to `CMake/` and shared by both builds, keeping regex internals local to each binary. The named version node is retained so it can coexist with other version scripts.

A compiled reproduction using Slicer’s name-filter parser and the bundled Qt WebEngine fails without the protection and passes with it for both shared libraries and modules. Symbol checks confirm that the conflicting helpers are hidden and existing GSSAPI symbol versions are preserved. A full Slicer rebuild has not been run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29d7377e9ee1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.