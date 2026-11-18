# Issue

**Title:** FIX: strip whitespace and normalize decimal commas in TSV cells

## Description

Two TSV-cell normalizations in `_from_tsv`: strip whitespace (so `"n/a   "` matches `"n/a"`) and rewrite digit,digit decimal commas (`"0,5"` -> `"0.5"`) for European-locale datasets. Both happen before the dtype cast, so downstream `float()` and `_drop()` calls succeed on real-world OpenNeuro TSVs.

Same shape as #1587, #1591, #1593: more generous reading of cell content that the BIDS spec doesn't strictly allow but real datasets contain.

Reproducer:

```python
from mne_bids.tsv_handler import _from_tsv
# events.tsv body: "onset\tduration\n0,5\t1,25\nn/a    \t1.0\n"
d = _from_tsv("events.tsv")
# main:    d["onset"] == ["0,5", "n/a    "]  -> float() raises
# this PR: d["onset"] == ["0.5", "n/a"]
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9120b8932a8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.