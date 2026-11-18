# Issue

**Title:** [FIX] Make download_cognitive_atlas work under pandas 3

## Description

No issue filed.

`download_cognitive_atlas()` raises `KeyError: 0` on a fresh install. `_expand_df` scores aliases with `df[["alias", "name"]].apply(_get_ratio, axis=1)`, which passes each row as a labelled Series, and `_get_ratio` indexed it as `tup[0]`/`tup[1]`. That relied on positional fallback for `Series.__getitem__`, which pandas 3 removed. `setup.cfg` allows `pandas>=2.1.4`, so a fresh environment gets pandas 3.

Changes proposed in this pull request:

- Unpack the row (`alias, name = tup`), which works for Series, tuples and lists on any pandas version.
- Add a test of `_expand_df` on a one-row frame.

Checked end to end under pandas 3.0.6: `download_cognitive_atlas()` now returns the ids (2,371 rows) and relationships (7,288 rows) tables.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Ensure cognitive atlas expansion remains compatible with pandas 3 and validate the fix with a focused regression test.

Bug Fixes:
- Fix cognitive atlas downloads under pandas 3 by making alias similarity scoring compatible with labelled rows passed by DataFrame.apply.

Tests:
- Add coverage verifying alias similarity scoring in _expand_df.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171d769a2de5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.