# Issue

**Title:** CI: Build against system pugixml on Ubuntu 20.04

## Description

Starting with Ubuntu 20.04, the `libpugixml-dev` package ships with a CMake config and if there's one thing distributors love it's packages not bundling everything they use. This builds require `libpugixml` to be installed, but the deb package lists it explicitely:

```
$ dpkg -I liblsl-1.14.0-focal_amd64.deb 
 neues Debian-Paket, Version 2.0.
 Architecture: amd64
 Depends: liblsl (= 1.14.0-focal), libc6 (>= 2.29), libgcc-s1 (>= 3.0), libpugixml1v5 (>= 1.6), libstdc++6 (>= 6)
 Description: Labstreaminglayer C/C++ library
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fcc1bfc8acb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.