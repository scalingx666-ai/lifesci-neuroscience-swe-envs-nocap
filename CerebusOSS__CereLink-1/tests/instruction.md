# Issue

**Title:** CMake Build System and Linux Compilation Bugfixes

## Description

I've added a CMake build system.  All you should need to do is go to the build directory and execute

```
cmake .
make
sudo make install
```

And you'll have the binaries on your path.  This build system should also generate visual studio solutions, though its untested. I'd also like to add cbmex, n2h5, and cbpy (when available) to the CMake project at some point.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d4709b4186e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.