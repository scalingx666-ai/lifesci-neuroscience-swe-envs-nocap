# Issue

**Title:** fix(server): Prevent double close of superagent stream by switching to fetch for addFile

## Description

The previous superagent implementation here would sometimes double close a stream, resulting in unhandled exception. This simplifies to addFileString which is the only active use of this API and prevents the stream from being closed twice.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b8c086c5666`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.