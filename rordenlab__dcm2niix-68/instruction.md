# Issue

**Title:** Improving support for big-endian systems

## Description

I've recently created [`divest`](https://github.com/jonclayden/divest), a fork of `dcm2niix` packaged for R, and since published R packages are [automatically tested](https://cran.r-project.org/web/checks/check_results_divest.html) on several platforms the code gets exercised quite well. One thing that came up is that on SPARC/Solaris, a big-endian platform, `divest` was producing segfaults. I traced this to the code for reading CSA blocks, which are always stored little endian, but whose elements weren't previously byte-swapped.

In this PR I'm including some edits to byte-swap elements of the CSA-related `struct`s that are subsequently used by the code. I also check system endianness more robustly, rather than relying on the `__BIG_ENDIAN__` constant, which [isn't always defined](https://sourceforge.net/p/predef/wiki/Endianness/). (There should be no real overhead for this, since the compiler should optimise the `littleEndianPlatform` function out of existence.) With these changes the segfaults do seem to be resolved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4ddf4d5b80b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.