# Issue

**Title:** CMake: add LSLCMake functions to exported configuration

## Description

For #47, put the exported targets into a separate cmake file that gets included alongside the `LSLCMake.cmake` helper functions by `find_package`.

Suggested usage in apps:

```
find_package(LSL 1.13.0 REQUIRED
	HINTS ${LSL_INSTALL_ROOT}
	"${CMAKE_CURRENT_LIST_DIR}/../../LSL/liblsl/build/"
	"${CMAKE_CURRENT_LIST_DIR}/../../LSL/liblsl/build/install"
	PATH_SUFFIXES share/LSL
)
```

Tested:
- [X] in-tree builds (from an app dir)
- [X] in-tree builds (super-repo as root)
- [X] out-of-tree builds
- [X] from a cpack package

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2baef73c3e58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.