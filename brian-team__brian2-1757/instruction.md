# Issue

**Title:** Fix redundant system calls in C++ standalone run loop

## Description

**Description**
Fixes a performance bottleneck in the generated `network.cpp` file.

Currently, if `report` is enabled, the template generates code that calls `std::chrono::high_resolution_clock::now()` inside the inner loop for every single object. This triggers `N` system calls per timestep (where `N` is the number of objects), which kills performance on longer runs.

**Changes**
* Hoisted the `current` time check outside the `objects` loop in `brian2/devices/cpp_standalone/templates/network.cpp`.
* The time is now sampled just once per global timestep, removing the overhead while keeping reporting accurate.

****

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `407a3e51ff26`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.