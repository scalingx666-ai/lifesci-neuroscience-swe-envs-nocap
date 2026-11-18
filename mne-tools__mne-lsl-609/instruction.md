# Issue

**Title:** Build a single py3-none wheel per platform and test on Python 3.15/3.15t

## Description

`liblsl` is loaded through `ctypes`, so the wheels hold no CPython extension and don't depend on the interpreter ABI. The wheel is now tagged `py3-none-<platform>`, replacing the `cp311-abi3` and `cp314t` wheels: one wheel per platform covers every CPython >= 3.11, GIL or free-threaded (3.14t, 3.15t, and later versions).

Also tests on Python 3.15 and 3.15t instead of 3.14 and 3.14t, and upgrades `uv.lock` so that the test dependencies install from wheels on 3.15 (e.g. `numpy`, `scipy`, `matplotlib`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e39a1ac9948`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.