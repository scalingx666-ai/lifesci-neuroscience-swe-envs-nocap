# Issue

**Title:** Outlet: read the inlet's Data-Protocol-Version header

## Description

. The outlet now accepts `Data-Protocol-Version` (what inlets send) as well as `Protocol-Version` (kept for compatibility). No change on the wire today since inlets send the same version in the request line. Docs (streamfeed, debugging) updated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb50e8e47cdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.