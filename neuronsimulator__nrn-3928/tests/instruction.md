# Issue

**Title:** Fix the Windows installer exit 127 while copying the MinGW toolchain

## Description

The Windows installer job fails in `setup_exe` with exit 127. The NEURON build itself finishes. `cp_dlls` then runs the `cp.exe` it has just copied into the install tree. After `msys-2.0.dll` lands beside that `cp.exe`, the next copy exits 127. Once that copy uses `/usr/bin`, `mkdir` from the same half-built tree exits 127 the same way.

These are the two commits that made the installer green on #3870 (`3e15595f277`, `53427522368`), cherry-picked onto current master. The rest of the abi3 wheel work is not included. Master still installs Python 3.10.

- Retry the MinGW `pacman` install up to four times. Mirrors return 429, and a failed download does not commit. Copy the installer DLLs with `/usr/bin/cp` and the other real MSYS tools.
- Build neurondemo with `/usr/bin` and `/mingw64/bin`. The copied toolchain is still what the installer ships.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fec1f072b763`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.