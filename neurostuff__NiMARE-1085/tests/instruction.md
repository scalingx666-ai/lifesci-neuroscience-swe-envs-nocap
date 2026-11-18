# Issue

**Title:** Raise an informative error when a fetch query matches no files

## Description

`fetch_neurosynth`/`fetch_neuroquery` passed an unmatched query straight through `_fetch_database`, which returned an empty list and silently yielded no data — so a typo'd `source`/`vocab`/`type` looked like an empty result with no hint.

This raises an informative `ValueError` when a query matches no files in the bundled manifest, listing the available values per entity (version/vocab/source/type) for the requested data source. The match happens before any download, so the error is immediate. Adds a small pure helper (`_get_available_entities`) with unit tests, plus offline tests that the fetch functions raise.

### Before / after
```python
>>> nimare.extract.fetch_neurosynth(vocab="not_a_real_vocab", return_type="files")
```
Before:
```
[]        # silent empty result, no hint
```
After:
```
ValueError: No files matched the query {'vocab': 'not_a_real_vocab', 'data': 'neurosynth', 'version': '7'}.
Available options for data-neurosynth are: version: 3, 4, 5, 6, 7;
vocab: LDA100, LDA200, LDA400, LDA50, terms; source: abstract; type: tfidf, weight.
```

## Summary by Sourcery

Fail fast with actionable guidance when database fetch queries do not match any bundled files.

Bug Fixes:
- Raise an informative ValueError when a fetch query matches no files, including available entity values for the requested data source.

Enhancements:
- Add manifest-based entity discovery with source-scoped, sorted options and safe handling of unknown filename segments.

Tests:
- Add unit and offline fetch tests covering entity discovery, informative unmatched-query errors, and fallback messages.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4feadcd88fe7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.