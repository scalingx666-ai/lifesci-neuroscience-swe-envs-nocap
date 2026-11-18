# Issue

**Title:** feat(segments): add on_trigger_overlap guard to list_segments

## Description

## Summary

Adds an `on_trigger_overlap` parameter to `list_segments` that, **by default, raises** when two or more trigger events of the **same `type`** start at the **same time** on the **same `timeline`** (e.g. two `Fmri` events differing only by metadata such as `space`/`preproc`).

Such simultaneous, similarly-typed triggers silently produce duplicate/ambiguous segments and can corrupt train/test splits — the failure mode discussed in fairinternal/brainai#2531 (comment: ):

> 1. `list_segments(on_trigger_overlap='raise')` to ensure a single trigger, avoid bug with stride

The guard inspects only the **trigger** events (`events.loc[triggers]`), so legitimately overlapping *context* events are unaffected. It runs *before* the strided/non-strided branch, so it covers both modes (catching the "avoid bug with stride" case where colliding triggers would each expand into the same set of windows).

## API

```python
list_segments(events, triggers, *, on_trigger_overlap="raise" | "warn" | "allow")
```

- `"raise"` (default): error, printing the colliding `(type, timeline, start)` rows.
- `"warn"`: log a warning and still build the (duplicate) segments.
- `"allow"`: disable the check (previous behavior).

## Note on the default

Defaulting to `"raise"` is a deliberate behavior change matching the "(by default)" intent in the linked comment. It surfaces pipelines that build segments from simultaneous same-type triggers (e.g. multi-space `Fmri`); those should narrow the `triggers` mask or pass `on_trigger_overlap="allow"`. Happy to flip to `"warn"` if we'd rather phase it in.

Open question (flagged in review): should the collision key drop `type` and use only `(timeline, start)`? For the common single-type trigger this is equivalent; keeping `type` avoids false positives on intentional multi-type triggering where the trigger event carries meaning (e.g. `aggregation="trigger"`).

## Test plan

- [x] New unit test `test_on_trigger_overlap` in `test_segments.py`: covers `raise` (default + explicit), `warn` (logs + builds), `allow`.
- [x] ruff / codespell clean; mypy clean on `segments.py`.
- [ ] CI (lint, mypy, pytest neuralset).

Made-with: Cursor

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `997b0c1b609c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.