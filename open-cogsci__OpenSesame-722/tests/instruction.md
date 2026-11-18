# Issue

**Title:** avoid shader error for Linux with Nvidia drivers

## Description

workaround for well known Qt problem when running under Linux with Nvidia drivers:
https://forum.qt.io/topic/81328/ubuntu-qopenglshaderprogram-shader-program-is-not-linked

tested under:
Ubuntu 16.04
OpenGL 4.6.0
NVIDIA 396.82
OpenSesame 3.3.4a9

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc02d538560f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.