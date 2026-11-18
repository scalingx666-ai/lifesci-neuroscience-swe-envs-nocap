# Issue

**Title:** Fix idraw from PyPI wheel that fails with "invalid ELF header".

## Description

Linux wheels keep IV_ENABLE_X11_DYNAMIC on. Static idraw links
ivx11_assign into the executable, and ivx11_dyload resolves it with
dlsym(RTLD_DEFAULT). That symbol was not in .dynsym, so the lookup
missed and dlopen of the ET_EXEC idraw failed with "invalid ELF header".

This updates external/iv from 5843bf4 to . That commit exports ivx11_assign from
static Linux idraw, iclass, and idemo, and it includes iv master
through the merged MSVC and Win32 fixes.  is an ancestor of iv master ( merged ); both commits have the same tree.

The changes under test/foreign add a Linux foreign ctest that verifies idraw launches from an installed wheel.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1652e93fb44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.