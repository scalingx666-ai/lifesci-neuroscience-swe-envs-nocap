# Issue

**Title:** Fix socket creation on Windows

## Description

Create WSA sockets with the WSA_FLAG_OVERLAPPED flag on Windows.

The main and receive threads share the same socket, but a socket created with WSASocket() cannot be used by different threads by default.  WSA_FLAG_OVERLAPPED enables timeouts on socket operations and allows multiple concurrent requests on the same socket.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7248392c499c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.