# Issue

**Title:** Build doc

## Description

I added a more comprehensive set of build instructions when using the cmake build system.
I'm making this a PR first because I deleted the FindPython cmake files. These aren't necessary now that the Cython-based python module is the preferred module.

In fact, the python-extension version probably doesn't work anymore, at least not on the 7.0 branch. Should we get rid of it?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f8a33b6ac20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.