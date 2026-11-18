# Issue

**Title:** BF: terminate child before closing stdout/stderr on process timeout

## Description

`ThreadedRunner._handle_process_timeout` previously closed our end of the child's stdin/stdout/stderr *before* calling `process.terminate()`. Between the close and the SIGTERM landing, the child (or anything that shares its stdout fd -- e.g. a `tar`/`curl` helper that git-annex spawned) gets SIGPIPE on its next write and dies with signal 13.  Shell- style propagation through an intermediate exit-code translator surfaces this as `exitcode 141` to the runner's caller.

Observed in the wild on AppVeyor build 54014269 (test `test_add_archive_content`):

  CommandError: 'git ... annex get ... --json-progress -- '1/1 f.txt''
  failed with exitcode 141

git-annex itself catches SIGPIPE (Haskell GHC default), but its `tar` helper does not.  When the runner closes git-annex's stdout, the kernel delivers SIGPIPE to tar, and git-annex propagates tar's 141.

Reorder the teardown so the child is terminated (with a 1s SIGKILL escalation) *before* its stdout/stderr fds are closed.  stdin still closes first so a well-behaved child can wind down on EOF without needing SIGTERM at all.

Add a Linux+bash regression test in `test_sigpipe_on_timeout.py`: a SIGTERM-trapping bash child execs a SIGPIPE=SIG_DFL python emitter; the runner's teardown fires during the bash sleep window.  With the bug the emitter is killed by SIGPIPE (rc=-13); with the fix the runner escalates to SIGKILL (rc=-9) after the trap blocks SIGTERM.  Verified:

  - reverting the fix       -> test FAILS, rc=-13
  - with the fix in place   -> test PASSES, rc=-9
  - whole datalad/runner/   -> 71 passed in 36s

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48a7b69c53dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.