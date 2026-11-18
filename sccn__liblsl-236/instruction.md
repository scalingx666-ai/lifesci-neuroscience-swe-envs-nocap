# Issue

**Title:** Cleanup CMake redundancies and use FILE_SET for headers

## Description

This is an attempt to delete unneeded CMake code. Draft for now; I just want to trigger the CI runners.

**Installing Headers**

I struggled with this for a while. It should be the case that headers are installed automatically with `install(TARGETS ... INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})`, as long as the headers end up in the interface property of the installed target. And the headers _should_ be in this property of the lsl target when it links in lslobj. However, something wasn't quite working.

An alternative would be to use the `PUBLIC_HEADER` property. This worked to propagate the headers, but for some reason this flattens all the headers into a single folder.

Instead, I ended up going with a relatively new `FILE_SET` feature. This works well.

**LSLTargets.cmake**

It looks like we provide a hard-coded LSLConfig.cmake which is simply a wrapper around LSLTargets.cmake -- AND it forces the includes of LSLCMake.cmake. I'm going to try and remove the LSLConfig.cmake and instead generate that file (LSLTargets -> LSLConfig) with the consequence that we won't be forcing people to load LSLCMake.cmake if they find_target(LSL). I think it's likely that I will add it back, but it needs to be updated or cleaned. e.g., there's a bunch of code in there to help make Apple app bundles but that's a lot less useful now that Apple has increased MacOS security, unless we add in code signing and notarization but that's far less portable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18c26dd8aa87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.