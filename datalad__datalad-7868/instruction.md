# Issue

**Title:** BF: resolve -J auto for push/drop/remove instead of passing 'auto' to git-annex

## Description

## Summary

`push --jobs=auto` crashed with `option --jobs: cannot parse value 'auto'`, and `drop --jobs=auto` (plus `remove --jobs=auto`, which delegates to drop) silently swallowed the same `CommandError` and left content untouched.

Root cause: `_push_data`, `_drop_allkeys`, and `_drop_files` each appended `--jobs <jobs>` to the git-annex command manually before calling `_call_annex_records[_items_]` **without** `jobs=`, bypassing the `'auto'`-to-integer resolution that already lives in `AnnexRepo._call_annex` (annexrepo.py:958-968).

Fix: drop the three manual `cmd.extend(['--jobs', str(jobs)])` blocks; forward `jobs=jobs` to the `_call_annex_records*` calls so resolution happens uniformly in one place.

. **This PR only addresses the literal-`'auto'`-passed-verbatim half of the issue.** The other half — that `'auto'` resolves to `1` by default because `datalad.runtime.max-annex-jobs` / `datalad.runtime.max-jobs` default to `1`, making `-J auto` indistinguishable from omitting `-J` — is left for a follow-up.

## Commits

- 88e0c7665 `BF: resolve -J auto for push/drop/remove instead of passing 'auto' to git-annex`

<details><summary>Per-commit details</summary>

### 88e0c7665 `BF: resolve -J auto for push/drop/remove`

Three call sites built the git-annex command line themselves:

- `datalad/core/distributed/push.py:_push_data` — `cmd.extend(['--jobs', str(jobs)])` then `_call_annex_records(cmd)` with no `jobs=`. Crashed with a visible `CommandError`.
- `datalad/distributed/drop.py:_drop_allkeys` and `_drop_files` — same pattern, but each is wrapped in `except CommandError` that pulls captured results from `e.kwargs.get('stdout_json', [])`. With `'auto'` git-annex never produces any JSON before erroring, so the exception is caught and `drop` returns no results. `remove` inherits the bug via `Drop.__call__(jobs=jobs)`.

The fix is to delete the manual `cmd.extend` and pass `jobs=jobs` to `_call_annex_records` / `_call_annex_records_items_`. The existing logic at `annexrepo.py:958-968` resolves `'auto'` → `min(datalad.runtime.max-annex-jobs, max(3, cpu_count()))` and emits `-J<int>` only when the result is > 1.

Tests: tuned the existing `test_push.check_push`, `test_drop.test_drop_file_content`, and `test_drop.test_drop_allkeys` calls from `jobs=2` to `jobs='auto'`. Verified that with the manual handling restored, `test_push[True]` raises `CommandError` and `test_drop_allkeys` fails its post-drop key-count check, so the change provides regression coverage for both the crash and the silent-failure paths.

</details>

<details><summary>Manual reproduction (before vs after)</summary>

```text
$ datalad push --to=target --jobs=auto         # before
CommandError: 'git ... annex copy --batch -z --to target --jobs auto ...'
  failed with exitcode 1
option --jobs: cannot parse value `auto'

$ datalad drop --jobs=auto .                    # before
(no output, exit 0, files NOT dropped)
```

After:

```text
$ datalad push --to=target --jobs=auto
copy(ok): a_1.bin (file) [to target...]
copy(ok): a_2.bin (file) [to target...]
...
$ datalad drop --jobs=auto .
drop(ok): a_1.bin (file)
drop(ok): a_2.bin (file)
...
```

</details>

## Test plan

- [x] `pytest datalad/core/distributed/tests/test_push.py` — 19 passed, 1 skipped
- [x] `pytest datalad/distributed/tests/test_drop.py` — 16 passed
- [x] `pytest datalad/local/tests/test_remove.py` — 9 passed
- [x] Reverified with the patch stashed: `test_push[True]` raises `CommandError`, `test_drop_allkeys` fails its key-count assertion → modified tests do provide regression coverage.
- [ ] Follow-up PR for the `max-annex-jobs` / `max-jobs` default-of-1 half of #7867.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `041d65b431c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.