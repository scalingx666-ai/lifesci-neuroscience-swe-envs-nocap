# Issue

**Title:** CI: Build wheels for Python 3.14

## Description

This adds Python 3.14 to the wheel matrix in `wheels.yml`, with one cp314 entry for each platform that builds 3.13 wheels: Windows, manylinux x86_64 and aarch64, and macOS on Intel and Apple silicon.

No code changes are needed. The current nanobind bound (< 2.6) and cibuildwheel 4.1.0 both build cp314, and numpy 2.3 has cp314 wheels, so the numpy < 2.4 bound still resolves.

I built `main` locally for Python 3.14.7 on Linux x86_64 and installed the wheel into a clean environment, and the full test suite passed. The wheel workflow on my fork covers the other platforms: [link](https://github.com/galenlynch/ANTsPy/actions/runs/38789056834/job/116608555338).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78a26a1e2d59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.