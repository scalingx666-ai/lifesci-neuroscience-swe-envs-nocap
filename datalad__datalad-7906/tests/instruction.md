# Issue

**Title:** BF+DOC: make rerun fail like run does, and document exit-code handling

## Description

`rerun` is routinely used as a shortcut for repeating a previous `run`, so the two should fail the same way. They did not: `Run` sets `on_failure = 'stop'`, `Rerun` inherited the global `'continue'` default. This PR makes them congruent and documents the exit-code semantics that were undocumented on both sides.

## The divergence was not a decision

- **1042e588d** (2018, `ENH: run: Support runs with non-zero exit codes`) aborted both cases explicitly: a fresh run with a non-zero exit wrote `COMMIT_EDITMSG` and raised, and `_execute_command()` raised outright when a *rerun* exited differently than recorded.
- **9595f5e50** (2021, gh-3071) turned both aborts into yielded `status="error"` records, deliberately — *"This allows callers to control whether the save happens via the standard `--on-failure` switch."*
- **0f5abc49c** (2022, for gh-6427) then gave `Run` — and only `Run` — the `'stop'` default, so a command is not executed after a failed input/output preparation.

`Rerun` was never given a matching default, so both of the 2018 behaviors were silently lost on the replay path. The rerun tests in 9595f5e50 were rewritten to assert only the error result (with `on_failure="ignore"`), so nothing covered the dataset state afterwards.

Two consequences, both verified before the change:

```
% datalad run -i in.dat 'sh -c "echo run2 >> marker"'     # origin gone
get(error): in.dat (file) [Unable to access these remotes: origin]
# command not executed, tree clean -- correct, this is gh-6427

% datalad rerun                                           # same dataset
get(error): in.dat (file) [Unable to access these remotes: origin]
run(ok): ... ; add(ok): marker ; save(ok): .
# command executed without its input, new run commit created, datalad exits 0
```

and a re-execution whose exit code did not match the recorded one still saved the modifications, where the equivalent `run` leaves them unsaved for inspection.

## Changes

- `Rerun.on_failure = 'stop'`, with the reasoning in a comment. Both commands now document `[Default: 'stop']`.
- A run commit recorded in a *different* dataset is reported `notneeded` rather than `impossible`. `run` duplicates its record into every modified subdataset, so a subdataset's history can contain run commits whose `dsid` is the superdataset's; such a commit is skipped or cherry picked instead of re-executed — the outcome 85d54231a intended ("skip or cherry pick the commit using the same logic that's used for non-run commits", and that commit relaxed `_rerun()`'s abort from any non-ok status to `error` so it would not stop the replay). Since `on_failure` dispatches on status alone, leaving it `impossible` would now abort a `--since=` replay at the first such commit. `_report()` keys on the presence of `diff` instead of that status.
- **A replay that re-executes nothing at all now fails.** Per-commit `notneeded` keeps a mixed range going, but when *every* run commit in the range belongs to another dataset, `rerun` used to exit 0 having done nothing. It now ends with an `impossible` result — which restores the failure the pre-`stop` code produced for `datalad rerun` on a single such commit, without giving up on ranges. A range with no run commits at all is untouched; `_rerun_as_results()` already reports that.
- Docs: the exit code is always in the run record; `--on-failure ignore` preserves a non-zero exit as a regular provenance record; nothing is recorded when the command did not modify the dataset (also when it failed); a re-execution is `ok` when it reproduces the recorded exit code, `error` when it exits with a *different* non-zero code, and — the one asymmetry left — always `ok` when it exits 0, so a command that stopped failing is only detectable by comparing `exit` against the record it was derived from (last entry of its `chain`).

## Tests

- `test_run_failure`: a re-execution with a mismatching exit code records nothing.
- `test_rerun_unavailable_input` (new): a rerun whose input cannot be obtained does not execute the command and records nothing.
- `test_rerun_range_with_foreign_run_commit` (new): a range replay skips a superdataset's run commit and continues with the subdataset's own one — this fails if the status goes back to `impossible` — and a replay of that commit alone raises `IncompleteResultsError` with an `impossible` result.
- `test_rerun`: the foreign-dsid expectation updated to `notneeded`.

The new assertions deliberately avoid `repo.dirty` and "a new commit exists": on an adjusted branch an output is removed rather than unlocked before a re-execution, so an appending command recreates it identically. The first CrippledFS run caught exactly that; fixed in 565bd68.

All 33 GitHub Actions checks are green on the current head `e6d11e35`, CrippledFS and the macOS matrix included. Locally `datalad/local/tests/test_rerun.py` (23 passed, 1 xfailed), `datalad/core/local/tests/test_run.py`, `test_run_procedure.py` and `interface/tests/test_docs.py` pass; codespell clean, no new flake8 findings.

## Notes for review

- This is a behavior change on `maint`: a mismatching rerun no longer commits. That is what `run` has always done. Labeled `semver-patch`, changelog snippet in `changelog.d/pr-7906.md` under Bug Fixes.
- Known, pre-existing and untouched here: under `--onto=`/`--branch=`, a foreign-dsid commit is *cherry picked*, producing a commit that carries the run record verbatim (`cmd`, `exit`, `chain: []`) although the command was never executed — the only signal is that the record's `dsid` belongs to another dataset. Making the pick visible in the result stream, and recording the picked hexsha in `chain`, are both possible; see the review thread.
- `# TODO: add --on-foreign-run=error|auto if a need arises for more detailed control` sits next to the status, for the day this needs explicit control.
- Follow-up left out on purpose: the `COMMIT_EDITMSG` recovery record is still only written for non-rerun failures (`if not rerun_info and cmd_exitcode`), so a failed rerun leaves an uncommitted state without one. Dropping that guard would complete the symmetry, but `Run.custom_result_renderer()` is what points users at the file and `Rerun` has no such renderer.
- For #7902/#7903: `--on-cmd-failure` should apply to both commands with the same default. #7903 also carries over `if cmd_exitcode and expected_exit != cmd_exitcode`, so the "recorded non-zero, now exits 0" case stays unflagged — worth deciding there. It also targets `maint` although #7902 is labeled `enhancement`.

## PR checklist

- [x] Overview of the changes provided above
- [x] Changelog snippet in `changelog.d/pr-7906.md`
- [x] Relates to #7902 / #7903 and gh-6427; deliberately no `Fixes` keyword — the divergence has no issue of its own, and gh-6427 is only referenced, not closed by this PR

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01TpYt6fWVTvbRn4CH9pPBb8

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78b76f8b3716`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.