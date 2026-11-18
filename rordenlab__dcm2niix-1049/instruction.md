# Issue

**Title:** WASM: free each output from MEMFS as it is collected

## Description

collectOutput built each File from FS.readFile, a copy, and the MEMFS originals were only removed in finally, so every output was held twice until all of them were collected. Build the File from the node's bytes and unlink it straight away.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b5765e551d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.