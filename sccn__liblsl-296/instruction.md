# Issue

**Title:** Avoid recursive UDP resolve traversal (rebased #292)

## Description

Resolution can recurse once per skipped endpoint or interface, growing the stack with large port ranges and mixed IPv4/IPv6 targets. Replace synchronous recursive calls with iterative traversal while retaining the asynchronous send chain.

Rebases #292 onto current `dev`, preserving @zeyus's authorship. Conflict resolution retains the receive socket for outgoing queries, nonthrowing multicast-interface selection, and the cancellation guard before accessing the socket. The original fork does not allow maintainer edits, so this is a replacement integration PR.

Validation: macOS Release build with `LSL_UNITTESTS=ON` and `LSL_FRAMEWORK=OFF`; bad-interface, advertised-query-port, same-machine discovery, and TCP-fallback regressions plus exported resolver tests passed (12 assertions across 7 cases). `git diff --check` passed. Windows/Linux runtime validation is left to CI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab5e080b6799`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.