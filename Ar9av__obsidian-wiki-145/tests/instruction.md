# Issue

**Title:** fix: make cache-check/cache-update work with the manifest shape the skills write

## Description

.

## Reproduced

`cache-check` / `cache-update` were written for a dict-keyed manifest with bare
hex hashes, but the `wiki-ingest` skill writes `sources` as a **list of entry
objects**, each with a `path` field and a `sha256:`-prefixed `content_hash`.
Both shapes exist in real vaults — confirmed against two on this machine (one
list-shaped, one dict with `sha256:` prefixes).

Against a skill-built (list-shaped) manifest the crash reproduces exactly as
reported:

```
$ python3 -c "from pathlib import Path; from obsidian_wiki import cache; \
    cache.check_sources(Path('vault'), [Path('vault/projects/prismor/prismor.md')])"
AttributeError: 'list' object has no attribute 'get'
```

Three failures stacked: (1) crash on list-shaped `sources`; (2) `sha256:` prefix
vs. bare hex → every unchanged file reported `modified`; (3) vault-relative
stored paths vs. absolute query paths → every file reported `new`. Plus a
data-loss hazard: `update_source` round-tripped the manifest through a
path-keyed dict, collapsing legitimate duplicate-path entries and rewriting
list manifests into a shape the skills' append logic no longer expects.

## Fix

Implements the four fixes the reporter outlined:

1. **Read both shapes** — `_iter_entries` indexes dict entries by key and list
   entries by their `path`/`source_id`.
2. **Prefix-insensitive hashes** — strip an optional `algo:` prefix on both
   sides before comparing.
3. **Match paths across forms** — raw string (covers URLs/pseudo-keys), then
   resolved absolute, with relative keys resolved against the vault root.
4. **In-place `update_source`** — updates the matching entry or appends,
   preserving manifest shape, duplicate-path entries, skill-written fields
   (`pages_created`, `size_bytes`, `source_type`, …), and top-level keys
   (`stats`/`version`).

Also: URL / pseudo-path source keys are no longer falsely flagged
missing-on-disk.

## Tests

New `tests/test_cache_manifest_shapes.py` pins all four failure modes plus the
URL guard. Full suite green:

```
$ python3 -m pytest -q
240 passed, 14 subtests passed
```

The 29 existing `test_cache.py` cases (dict-shape, bare-hex) still pass
unchanged — the fix is additive.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6740bb592fd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.