# Issue

**Title:** BF(TST,CI): mark flaky rerun-merges test + split full NFS cron job

## Description

Address two CI issues surfaced by the 2026-04-17 scheduled run (https://github.com/datalad/datalad/actions/runs/24554006260):

1. `test_rerun_unrelated_mutator_left_nonrun_right` failed once in the `(3.10, true, true, 1)` job (git-annex 10.20230126 standalone, from conda).  The rerun of `echo foo >>foo` exited 2 with `/bin/sh: 1: cannot create foo: Permission denied`, even though the preceding unlock reported `notneeded` in the action summary — git-annex believed `foo` did not need unlocking, yet the working-tree copy was still read-only after the `--allow-unrelated-histories` merge.

   The same job matrix configuration (job `8_test (3.10, true, true, 1)`) passed in the same run, and 100 sequential local runs with git-annex 10.20260316 all passed, so this looks like an intermittent git-annex state issue specific to the pinned standalone 10.20230126 build.

   Mark the test with `@pytest.mark.flaky(retries=2, only_on=[IncompleteResultsError])` so a single transient failure does not break CI.  The project already uses this pattern for similar intermittent failures in `test_create_sibling_gitea.py` and `test_http.py`.  If retries keep failing, the pytest-retry output will make it obvious the issue is real rather than a one-off flake.

2. The cron-only `test (3.10, true, true, /tmp/nfsmount, 1200)` job has been cancelled by GitHub Actions' 6-hour job timeout on *every* scheduled run for the past month (verified via the API across all of April 2026 cron runs).  The job runs the full datalad suite on an NFS mount where a single test can take 600–900s (e.g. `datalad.support.tests.test_fileinfo.test_subds_path`, 909s).

   A separate scoped NFS job already covers `datalad.tests datalad.support` reliably in ~67 minutes.  Set `TESTS_TO_PERFORM` on the "full" job to the complement of that scope (every other datalad subpackage) so the two jobs together still cover the whole suite on NFS without the 6h-timeout kill.  The job keeps `allow-failure: true` and `cron-only: true`, so this change cannot make CI redder than today, only less so.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e1eee2402d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.