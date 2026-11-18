# Issue

**Title:** Support VTK 9.x

## Description

This approach creates a CMake interface library with no source files which our dependencies are linked against.

This interface library is then linked against chaste libraries and executables.

This allows us to use the modern [`target_link_libraries` ](https://cmake.org/cmake/help/latest/command/target_link_libraries.html) method of ingesting dependencies, whereas we had previously been relying on populating lists of libraries and include directories, which is a much older CMake pattern.

VTK 9 is the first dependency that is no longer compatible with this old way of doing things, but part of the work on modernising our CMake infrastructure will be to migrate all our dependencies over to this new way of doing things.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7ee62a05875`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.