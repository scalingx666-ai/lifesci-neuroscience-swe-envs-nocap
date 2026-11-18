# Issue

**Title:** Fix MacOS GHA CI

## Description

For some reason, the brew installation of CMake in the MacOS GHA CI started failing with:

```plaintext
Error: cmake was installed from the local/pinned tap
but you are trying to install it from the homebrew/core tap.
Formulae with the same name from different taps cannot be installed at the same time.

To install this version, you must first uninstall the existing formula:
  brew uninstall cmake
Then you can install the desired version:
  brew install cmake
```

so if we follow the advice it should work again.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d990513ba47`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.