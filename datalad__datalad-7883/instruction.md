# Issue

**Title:** BF: get_dataset_root - prefer symlinked dataset over unrelated parent .git

## Description

## Summary

In a symlinked checkout, `datalad status` / `datalad rerun` could
silently bind to an *unrelated* parent dataset.  Scenario from the
issue:

- `cwd` is `/A/symlink/`, where `symlink` → `/B/`
- `/B/` is the real dataset
- `/A/` has a stray empty `.git/` (an abandoned `git init`)

`git status` and `git annex info` correctly identified `/B/` as the
repo, but `datalad status` walked up the symlink's *apparent* path,
hit `/A/.git`, and reported on the wrong dataset.

Root cause is in `datalad.utils.get_dataset_root()`: it already had a
"the symlink itself is a dataset" check, but only as a fallback after
the upward walk found nothing.  This PR moves that check to *before*
the walk, so a symlinked dataset wins over any `.git/` further up the
apparent path — matching `git`'s symlink-resolving behavior.

Pure block reorder, no new logic; behavior is unchanged for any input
that is not a symlink at the top level.

## Commits

- 5672a7706 `BF: get_dataset_root - prefer symlinked dataset over unrelated parent .git`

<details><summary>Verification</summary>

Red/green test in `datalad/tests/test_utils.py::test_get_dataset_root_symlinked_dataset`:

- Against unmodified source: FAILS — `get_dataset_root` returns the bogus parent.
- After fix: PASSES.

End-to-end with the issue's literal `datalad status` scenario:

```
# Before
$ datalad status
untracked: /tmp/repro/parent/symlink (symlink)   # WRONG dataset

# After
$ datalad status
nothing to save, working tree clean              # CORRECT dataset
```

Existing tests still pass:

- `datalad/tests/test_utils.py::test_get_dataset_root`
- `datalad/distribution/tests/test_dataset.py::test_symlinked_dataset_properties`
- `datalad/distribution/tests/test_dataset.py::test_resolve_path_symlink_edition`

</details>

## Test plan

- [x] New red/green unit test added (`test_get_dataset_root_symlinked_dataset`)
- [x] Verified bug reproduces on unmodified source
- [x] Verified fix resolves both unit test and the issue's literal `datalad status` scenario
- [x] No regression in adjacent symlink tests
- [x] Changelog fragment `changelog.d/pr-7883.md`

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `249d9659fcab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.