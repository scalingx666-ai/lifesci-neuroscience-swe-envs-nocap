# Issue

**Title:** ENH: Add flag to exclude specified dylibs from being signed

## Description

This PR proposes an additional flag for SlicerSignBundleMacOS.py which allows certain dylibs to be excluded from signing as introduced by  My use case is for a custom Slicer application which bundles some black box third party libraries which use tamper detection and error out when the library binaries change. I was seeing these files have changed hash values after the cpack step and traced it here. 

Usage in my custom app looks like the following in its CMakeLists.txt:

```
set(Slicer_CPACK_BUNDLE_FIXUP_IGNORE_LIBRARY_REGEXES "^libMyLibrary.*[.]dylib$" CACHE STRING "" FORCE)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bccfb40d023a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.