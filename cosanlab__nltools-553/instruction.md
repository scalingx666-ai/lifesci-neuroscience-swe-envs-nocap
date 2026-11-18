# Issue

**Title:** Land the three 0.6.0 follow-ups: make_cosine_basis unit, align n_features default, shared Haxby block order

## Description

Three follow-ups pulled into 0.6.0 from the #535 sweep, small enough to land together before release verification (#507).

- **#550** `make_cosine_basis` — the second argument is now named `sampling_interval` (seconds between observations, SPM's `RT`), which is what it always took. Positional calls are unchanged; `sampling_freq=` by keyword raises `TypeError`. Migration row in the Statistics block. The docstring now states the basis count SPM's `spm_filter` actually keeps (the constant is dropped).
- **#540** `align(n_features=None)` resolves to the smallest subject's size along the aligned axis instead of subject 0's, so ragged SRM input fits whichever subject comes first. A call that fit before resolves to the same number; no migration row.
- **#537** `load_haxby_example(block_order="shared")` draws one block order and reuses it for every run, so ISC, ISRSA and alignment examples can compare runs TR by TR. The default `"independent"` is byte-identical to the previous output. The quickstart uses it and drops its TR re-sorting helper; the vocabulary manifest gains the keyword.

, , .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `acdd5c538e55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.