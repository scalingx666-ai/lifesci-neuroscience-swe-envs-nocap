# Issue

**Title:** Impersonation by Websocket Message

## Description

* Implements new Websocket message with type `IMPERSONATION`
* Impersonates into or first creates the `uuid` transmitted in `IMPERSONATION` message

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13797ce444b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.