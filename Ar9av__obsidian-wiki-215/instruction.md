# Issue

**Title:** feat(staging): port staged-write promotion into Python

## Description

.

`_staging/` promotion existed only as agent instructions — `grep -rn "_staging" obsidian_wiki/` returned nothing. This adds the mechanical half so a UI or CLI can promote a staged page without a second copy of the rules.

## `obsidian_wiki/staging.py`

| Function | Does |
|---|---|
| `list_staged(vault)` | Inventory, classified `new` / `update` / `patch`, with both sides' content revisions pinned |
| `promote(vault, rel, …)` | Atomic `os.replace` to the live path |
| `discard(vault, rel)` | Move to `_raw/rejected-…`, never clobbering an earlier rejection of the same page |

Promotion is a **rename**, so the page that lands is byte-for-byte the one that was reviewed — arbitrary frontmatter, prose and wikilinks survive untouched. There's a test asserting `read_bytes()` equality.

## The revision check

The reason this module exists. An agent can write to `_staging/` or to the live page while a human is mid-review, so callers pass the hashes they saw:

```python
promote(vault, rel, expected_staged_revision=…, expected_live_revision=…)  # StagingConflict, nothing moved
promote(vault, rel, pin_live_absent=True)   # "there was no live page when I looked"
```

`pin_live_absent` exists because a bare `expected_live_revision=None` can't distinguish "I didn't pin this" from "I assert there was no file".

## CLI

`obsidian-wiki staging list|promote|discard`, with `--expect-staged` / `--expect-live` / `--expect-new`. Exit **9** on conflict, distinct from 1 for bad input, so a caller can tell "re-read and ask again" from "you passed something wrong".

## Judgment stays in the skill

`.patch.md` files are listed with `kind: patch` and **refused** by `promote()`. Merging a human-readable diff into a page whose surrounding text may have moved is not mechanical. `SKILL.md` now calls the commands instead of restating the steps, and still owns the merge.

## Reuse

`server._resolve` and the `/v1/staging` listing were each carrying their own copy of this logic; both now call the shared module.

## A bug this found

Anchoring a caller path under `_staging/` isn't enough on its own — `../concepts/live.md` resolves to a path that is still inside the vault, so it passed the boundary check and a **live** page would have been promoted or discarded as if it were staged. `_staged_file` now also requires the resolved path to sit under `_staging/`. Covered by `test_a_live_page_cannot_be_promoted_as_if_it_were_staged`.

## Notes on the acceptance list

The `.manifest.json`-goes-through-the-lock criterion is vacuous as implemented: promotion doesn't write the manifest. Skills already record the final page path, not the staged one, so there's nothing to rewrite at promote time. `log.md` gets one `STAGE_COMMIT` line per invocation. Happy to add a manifest write if you'd rather promotion recorded itself there.

25 new tests; full suite 745 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e9e6abeaed4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.