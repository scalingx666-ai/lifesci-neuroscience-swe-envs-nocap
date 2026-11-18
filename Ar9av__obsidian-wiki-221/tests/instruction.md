# Issue

**Title:** fix(cli): resolve cache source args against the vault root as fallback

## Description

## Summary

`cache-check` and `cache-update` resolved relative source arguments against the
shell's CWD only. A vault-relative argument — the same form the manifest itself
stores — only worked when the shell happened to sit at the vault root. This PR
adds the vault root as a fallback resolution root for both commands, and turns
`cache-update`'s missing-source crash into a clean, actionable error.

## Problem

The manifest stores portable, vault-relative source keys (`Raw/database/x.pdf`),
and the library layer reads them that way: `cache.resolve_key` resolves any
relative key against the vault root (source-key contract v2). The CLI layer,
however, resolved its `source` argument against the CWD:

```python
source = Path(args.source).expanduser().resolve()   # CWD-relative
```

So the documented habit of passing a vault-relative path
(`obsidian-wiki cache-update <vault> "Raw/database/x.pdf"`) broke in three ways
whenever the CWD was not the vault root:

1. **Crash** — the CWD-joined path does not exist; `compute_hash` raised a raw
   `FileNotFoundError` traceback.
2. **Silent corruption (worse)** — a same-named path under the CWD got hashed
   instead. `stored_key()` then derived a key outside the vault, which could
   match no existing entry: a spurious manifest entry was appended while the
   real entry kept its stale hash, so subsequent `cache-check` runs reported
   the real source as `unchanged`.
3. **Confusing ergonomics** — the *stored* key is always normalized to
   vault-relative, so absolute paths were always safe; only the resolution step
   disagreed with the storage step about what "relative" means.

## Fix

- New helpers in `cli.py`, used by both `cmd_cache_check` and `cmd_cache_update`:
  - `_source_candidates(vault, raw)` — absolute args keep only themselves;
    relative args resolve against the CWD **first** (long-standing behavior,
    keeps out-of-vault sources working), then against the vault root.
  - `_resolve_source_arg(vault, raw)` — first candidate that exists on disk;
    when none exists, returns the CWD-relative form so read-only callers can
    classify it as missing.
- `cmd_cache_update` treats a missing result as an error: it prints
  `error: source X does not exist (tried <cwd path> and <vault path>)` and
  exits 1, replacing the traceback.
- `cmd_cache_check` keeps its non-fatal semantics: a query path that exists
  nowhere lands in the `missing` bucket, as before.

CWD-first ordering preserves backward compatibility: out-of-vault relative
paths (e.g. ingesting `../notes/x.pdf` from a sibling directory) resolve
exactly as before, even when the vault contains a same-named file.

| Argument form | Before | After |
|---|---|---|
| Absolute path | resolved as-is | unchanged |
| Relative, exists under CWD | CWD-relative | unchanged (CWD wins) |
| Relative, exists only under vault root | crash / wrong file | resolved against vault root |
| Relative, exists nowhere | `FileNotFoundError` traceback | clean error naming both candidates (`cache-update`); `missing` bucket (`cache-check`) |

## Testing

- New `TestCacheCLIVaultRelativeSources` in `tests/test_cache.py` covers:
  vault-relative update from a foreign CWD (stored key stays
  `Raw/database/x.pdf`); vault-relative check from a foreign CWD reporting
  `unchanged`; CWD-relative precedence when both candidates exist; clean
  no-traceback errors for missing relative and absolute sources.
- Full suite: `844 passed, 4 skipped, 19 subtests passed`.

## Notes

- Docs deliberately unchanged: existing examples in `docs/cli.md` already use
  absolute paths, and the storage side (portable key normalization) is
  untouched.
- `cache-hash` is untouched — its `path` argument has no vault relationship.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `add6b9acd900`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.