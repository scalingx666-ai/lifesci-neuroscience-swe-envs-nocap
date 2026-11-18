# Issue

**Title:** fix(docs): handle NaN metadata cells in macro table generator

## Description

## What
Fix a crash in `scripts/generate_macro_table.py` that breaks `make html` whenever a dataset has a missing (`NaN`) value in an optional metadata column (country, DOI, etc.).

## Why
pandas stores missing cells as float `NaN`, which is **truthy**. The string formatters in `_format_cell` guard with `if not value:` — that guard lets `NaN` through, and the formatter then runs `str`/`len` operations on a float and crashes:

```
TypeError: object of type 'float' has no len()             # country_flag
AttributeError: 'float' object has no attribute 'replace'  # _doi_link
```

This surfaced after the metadata catalog (#868) added many optional columns that are empty for most datasets.

## Fix
Normalize `NaN` to `""` once at the top of `_format_cell`, before dispatching to any formatter. This centrally covers every string formatter (country, DOI, data URL, health) instead of patching each one individually.

## Verification
`make html-noplot` builds green (exit 0); the macro table generates for all 158 datasets.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c9d0ff1aef7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.