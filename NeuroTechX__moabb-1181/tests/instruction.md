# Issue

**Title:** fix(download): sanitize '~'-prefixed URL components and migrate existing '~bci' ghosts

## Description

## Problem

BNCI datasets are served from `https://lampx.tugraz.at/~bci/database/...`. MNE's `_url_to_local_path` mirrors the URL path verbatim into the cache root (stripping only the leading `/`), so the server's `~bci` user component becomes a **literal local directory** named `~bci`:

```
~/mne_data/MNE-bnci-data/~bci/database/013-2015/Subject01_s1.mat
```

This bites in three ways:

1. **Tilde components are landmines** — shell word-start expansion, backup/sync tools, and glob-based scripts that interpret `~` as "home" can misbehave around a directory literally named `~bci`.
2. **Cache duplication across MOABB versions**: older releases mirrored `bnci-horizon-2020.eu/database/data-sets/`, current ones mirror `lampx.tugraz.at/~bci/database/` — the same files land in two trees and neither is found by the other layout.
3. **The existing legacy-migration machinery could never fire for these URLs**: `data_dl` computes both `destination` and `legacy_destination` through the *same* `_sanitize_path`, so they are identical whenever the URL contains no characters from the sanitize table — and `~` was not in the table.

## Fix (two lines + tests)

1. `_sanitize_path`: add `~` to the translated character set → `~bci` becomes `-bci` in every destination.
2. `data_dl`: the legacy lookup now uses the **raw** (unsanitized) mirrored path, so pre-fix `~bci` files are found and the existing `legacy_destination.replace(destination)` branch **migrates them in-place** instead of orphaning them into a full re-download.

## Verification

- Existing `~bci` ghost file is migrated to the `-bci` path with **no network access** (pooch short-circuits on the matching known-hash).
- Fresh installs download directly into the sanitized path; `~bci` is never created.
- Non-`~` URLs are unaffected (raw and sanitized paths coincide); the zenodo normalization in `_normalize_destination` is untouched.
- Unit tests added to `moabb/tests/test_download.py` (no download mark, no network).

## Context

Discovered while regenerating BNCI 2015-013 benchmarks: a 3.2 GB `~bci/` ghost duplicated an existing NEMAR cache byte-for-byte (md5-verified) because the layout mismatch prevented any cache hit. This affects every current BNCI fetch on lampx URLs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2dcaca16ae6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.