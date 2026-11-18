# Issue

**Title:** fix(cache): resolve vault-relative manifest keys in cache-check

## Description

. Thanks @gujialind — the root-cause breakdown pointing at the two lines and the CWD-vs-vault detail made this fast to fix and test.

## What was broken

`cache.py`'s docstring promises `<abs-or-rel-path>` manifest keys, but `check_sources` didn't honor the relative form:

- **Lookup** matched an entry only by the passed key or its abspath. A manifest storing `_raw/articles/foo.md` never matched an absolute path the CLI naturally passes, so the source came back `new`.
- **Missing detection** used `Path(key).exists()`, which resolves a relative key against CWD. When CWD wasn't the vault root, the file read as gone and every relative key landed in `missing`.

Either way, incremental-skip broke for anyone using the documented relative keys.

## The fix

- Lookup now also tries `os.path.relpath(path, vault)`, so an absolute path matches a vault-relative key.
- Missing detection resolves relative keys against the vault root (`vault / key`) instead of CWD, and the "already checked" set now includes each path's relative form too.

Absolute keys behave exactly as before.

## Test gap closed

Every prior `test_cache.py` case used absolute keys (`str(src_file)` on a `tmp_path`), so the relative path never ran in CI. Added four cases covering a vault-relative key: `unchanged` when passed an absolute path, not falsely `missing`, `modified` on a hash change, and still `missing` when the file is genuinely gone.

I reran the issue's CLI reproduction against this branch — both the absolute-path and relative-path calls now report `unchanged`. Full suite green (29 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a9c1f3d7044`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.