# Issue

**Title:** fix(experience_store, gpu_lock): recover drifted kernel names, stop leaking the lock fd, name the lock holder

## Description

, , .

## Summary

- **experience_store `sync-local` (#594).** When the exact key misses, a tree entry still matches if its kernel name has the same tokens as the lane's name once carrier words (`triton`, `hip`, `ck`, `cuda`, `torch`, `kernel`) are dropped, and the name states a shape (`n19456`, `k2560`, ...). A shapeless name never loose-matches, and neither does a name that only contains the other. A loose match is counted in `skipped.matched_loose`, and `sync-local` also files it under the lane's name so the lane's exact read finds it. Summary counters still count each entry once.
- **gpu_lock: the command does not inherit the lock fd (#595).** The pin and pool paths run the command with `200>&-` / `{POOL_FD}>&-`. The wrapper keeps its own copy, so the GPU stays locked while the command runs, and a leftover descendant no longer holds it afterwards. The multi-GPU lease path (#538) is unchanged.
- **gpu_lock: a blocked waiter names the holder (#596).** When the lock is busy, a pinned waiter prints a `NOTE` at once and lists the processes that have the lock file open (pid, ppid, command line). A pool waiter does the same once for its locked lanes. Output goes to stderr.

#569 (open; the fix for #567, nested `gpu_lock.sh`) touches different lines, so the two merge without a conflict, but they interact. #569's re-entrant path trusts an inherited `GEAK_GPU_LOCK_HELD` and runs the nested command without flock, while this PR stops the command inheriting the lock fd. With both merged, `gpu_lock.sh 0 bash -c 'gpu_lock.sh 0 python bench.py &'` would release GPU 0 once `bash -c` returns, while `bench.py` still runs on it. Whichever lands second should make the re-entrant path check that the holder is still alive (for example, export the holding subshell's PID next to the GPU id); dropping the variable would bring back the #567 deadlock.

## Test plan

- New tests, all failing on main:
  - `test_experience_store.py`: drifted-name match and non-match cases; a read-back under both names; `export-remote` publishes under the entry's own name.
  - `test_gpu_lease.py` (pin and pool): a descendant left by the command does not keep the lane, and a blocked waiter names the holder's pid and not its own.
- Full local L0 (every step of `ci-l0-checks.yml`) matches main. On this machine, two `test_experience_store.py` sync tests and one `test_run_e2e_trace_mirror.py` test also fail on main (environmental; CI on main is green). gitleaks is not installed here, and one node job needs node 20.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e1803e5633b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.