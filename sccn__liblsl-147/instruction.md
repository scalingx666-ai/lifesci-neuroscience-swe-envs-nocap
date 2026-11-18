# Issue

**Title:** `allow_random_ports`: Let the OS choose an open port

## Description

When all configured ports are bound and `allow_random_ports` is enabled, liblsl can try random ports to bind a socket to a port outside the configured range.

This PR changes the socket binding code to open port 0, i.e. let the OS find an open port or abort immediately if there's no free port or no interface to bind to (e.g. as seen in #45).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2ec186bbd8c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.