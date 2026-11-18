# Issue

**Title:** wraps http handlers to allow for recovery if there is a panic

## Description

I thought it more idiomatic to wrap the http handlers as specified in the book.  This code will prevent panics in a handler methos from killing the entire program.  I tested this code on a small example where I forced a panic in one of the handlers.  The message logged correctly and the program was still alive.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `062e40976cae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.