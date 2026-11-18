# Issue

**Title:** add `nobrainer info` command

## Description

This will be useful to collect info from users who submit issues.

Sample output:

```
$ nobrainer info
Python:
  Version: 3.7.6
  Implementation: CPython
  64-bit: True
  Packages:
    Nobrainer: 0.0.2+2.g27fd054
    Nibabel: 3.0.0
    Numpy: 1.18.1
    TensorFlow: 2.1.0
    TensorFlow-Probability: 0.9.0
System:
  OSType: Linux
  Release: 4.19.0-6-amd64
  Version: #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11)
  Architecture: x86_64
Timestamp: 2020/01/11 15:54:02
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be85958780b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.