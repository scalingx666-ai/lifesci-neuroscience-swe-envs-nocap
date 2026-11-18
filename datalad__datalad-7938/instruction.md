# Issue

**Title:** TST: speedup part B — stop paying for what is not under test

## Description

### Overview

Part B of `docs/testing-speedup-proposal.md`. Retargeted to `maint` now that #7935 (part A) is merged.

Each of these tests spent most of its runtime on something that was not the thing under test. All numbers are measured on one machine, before and after, against git-annex 10.20260901 from the PyPI wheel that part A adopts.

| | change | measured |
|---|---|---|
| **B1** | `test_files_split` against a lowered `CMD_MAX_ARG` | **124 s → 3 s** |
| **B2** | `git-annex testremote --fast --size=1KiB` | **60 s → 3.4 s** |
| **B3** | delete an uncollected `@turtle` in `test_s3.py` | — |
| ~~B4~~ | ~~remove `utils_testrepos.py`~~ — **tried, reverted**, see below | — |
| **B5** | tarball fixture reuse in `test_rerun_merges.py` | **−16%** |
| **+** | run `@turtle` somewhere at all | new 3-min job |

### B1 — chunking, without 10 000 files

The test materialised 100×100 files with 101-character names purely to push a command line past `CMD_MAX_ARG`. `generate_file_chunks()` reads `datalad.utils.CMD_MAX_ARG` from module globals *at call time*, so lowering it reaches the same code path with 200 files.

I checked that the lowered limit is what does the work, rather than assuming it:

```
files: 200 | path len: 39
real CMD_MAX_ARG = 1048576 -> chunks: 1
patched to 1000            -> chunks: 9
```

At the real limit those 200 paths produce **one** chunk — the test would pass while testing nothing. Hence the explicit `assert_greater(len(list(generate_file_chunks(files))), 1)`, which is load-bearing rather than decorative.

The full-size version survives as `test_files_split_heavy`, `@turtle` — and unlike before, `@turtle` now actually runs (below). This also retires the reason for the `@skip_if(on_github and on_nfs)` added in #7935; the skip moves to the heavy version with the 10k files that provoked it.

### B2 — `testremote` was moving 1 MiB keys around

`--size` defaults to 1 MiB and `--fast` was not passed. What the test is for is the RIA special remote's protocol surface, exercised either way. I confirmed both flags exist in `git-annex testremote --help` before relying on them.

At 3.4 s the `@slow` marker ("> 10 seconds") no longer describes `test_gitannex_local`, so it comes off. `test_gitannex_ssh` keeps `@turtle` — I could not measure the ssh path locally, so I left its marker alone rather than guess.

### `@turtle` ran nowhere — now it runs

Every matrix entry selected `-m "not(turtle)"` and nothing selected *for* turtle, so those tests ran on neither PRs nor cron. Three tests no job would ever have reported on. A marker only earns its keep if something honours it; otherwise it is a slower way to delete a test.

`-m "not(turtle)"` becomes `-m "${PYTEST_MARKERS:-not(turtle)}"`, with one new entry setting `PYTEST_MARKERS: turtle` on base Python and plain ubuntu. Measured 103 s under `-n 2`; PR jobs go 14 → 15, cap is 20. **Green in CI.**

This does re-introduce a marker knob that #7935 removed. `tools/ci/test-jobs.yml` says so and distinguishes it: the removed `PYTEST_SELECTION`/`PYTEST_SELECTION_OP` pair split every scenario into slow/not-slow halves, and overriding `PYTEST_MARKERS` anywhere but this one job would rebuild that.

### B4 — tried, reverted: this is extension API

The proposal said `utils_testrepos.py` had one in-tree user and the `datalad.tests.setup.testrepos` option had zero readers. Both true, both irrelevant — the consumers are **extensions**, and the Extensions job caught it two minutes after the push:

```
datalad_next/tests/utils.py:42:
    from datalad.tests.test_utils_testrepos import BasicGitTestRepo
E   ModuleNotFoundError: No module named 'datalad.tests.test_utils_testrepos'
```
```
datalad-deprecated, on datalad.tests.setup.testrepos:
E   RuntimeError: cannot obtain value for configuration item ... no default
->  test_auto.py, test_publish.py, test_testrepos.py all error at collection
```

`datalad-next` imports from the *test* module, so deleting what looked like a test for code that was also going took out that extension's whole suite. A grep over this repository cannot establish that something is unused when extensions import it. Reverted byte-for-byte; retiring it needs a deprecation cycle coordinated with the extensions, which is its own work. The proposal now carries a B4 section marked not-doable with both tracebacks so this is not rediscovered the same way.

### B5 — and a correction to the proposal

The proposal's rationale was wrong, and I corrected the document rather than implementing around it. Those 15 tests do **not** rebuild one hierarchy — they build 15 *different* commit graphs and merely share the empty `Dataset.create()` they start from. So the reusable artifact is an empty dataset and the win is 496 ms → 17 ms per test.

It is still the right pilot, but for a different reason than the one given: it is the only listed cluster that never wires two copies together. Unpacked copies share a dataset ID and annex UUID, which rules out `test_update.py`, `test_create_sibling.py` and `test_push.py` until P11. Verified by grep that nothing in this module clones, pushes, installs, or touches `.id`/uuid.

**Each copy gets a fresh `annex.uuid` anyway.** Sharing one is not merely untidy, it fails *silently*: git-annex reads a remote whose UUID matches its own as "me", so `git annex copy --to` exits 0 having transferred nothing, and a test asserting on the exit code would pass over an empty push. Demonstrated through the fixture's own code path:

```
fixture reidentify=False -> copy rc=0, B received 0 object(s)   SILENT NO-OP
fixture reidentify=True  -> copy rc=0, B received 1 object(s)   correct
```

Nothing in this module wires two copies together today, so this is insurance against a future test rather than a fix for a live bug. It costs about 2 s of the ~10 s saved — more than the 12.6 ms `config.set` itself, because git-annex does extra work the first time it meets a UUID its branch does not know:

```
create() per test (pre-B5)   50.9 s
tarball, no re-uuid          40.9 s   -20%
tarball + re-uuid            42.7 s   -16%
```

Measured back to back in one session; these absolutes run ~20% above the first B5 figures quoted in this PR's history because the container is slower now — the relative result is what reproduces. `datalad.dataset.id` is deliberately left shared: it lives in the committed `.datalad/config`, so re-randomising it would either dirty the worktree (these tests need it clean for `run`) or add a commit (they assert on exact commit graphs). Only the annex UUID causes silent misbehaviour.

### Verification

- `test_annexrepo.py` + `test_rerun_merges.py` + `test_s3.py`: 106 passed, 13 skipped, 2 deselected
- `test_ria_basics.py`: 7 passed, 10 skipped
- the turtle entry's exact command: 2 passed, 1 skipped (`test_gitannex_ssh`, no ssh host locally; CI provisions sshd)
- after the B4 revert: `datalad-next`'s import resolves, `cfg.obtain('datalad.tests.setup.testrepos')` returns `False`, `test_utils_testrepos` 3 passed
- `codespell` clean, `pylint -d all -e W1202 datalad setup.py` 10.00/10

### PR checklist

- [x] Overview of the changes and rationale provided above.
- [x] Changelog snippet: `changelog.d/pr-7938.md`.
- [ ] Not fixing an existing issue.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01YGSwPWNihxaGvXxPGZvrWZ

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2f022292d92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.