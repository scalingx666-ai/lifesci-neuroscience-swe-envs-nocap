# Issue

**Title:** Read all XDF datasets with a built-in reader; retire the pyxdf dependency

## Description

Found by the 141-dataset equivalence sweep: every gamified (XDF) session of `AguileraRodriguez2025` fails with `ValueError: invalid literal for int() with base 10: '360060.0'` — the recorder wrote a **non-conforming XDF footer** (float `sample_count`), and pyxdf 1.17.5's new `_truncate_corrupted_offsets` does `int()` on it. The dataset was unloadable for everyone, upstream and NEMAR alike, and the failure is in the dependency, not the data.

## Fix
A minimal built-in XDF reader (`moabb/datasets/_xdf.py`): regular numeric streams + irregular string-marker streams, **pyxdf-shaped output** (info fields as lists, nested `desc`, `time_series`/`time_stamps`) so call sites keep their logic unchanged; pyxdf's per-segment linear **dejittering** and its **clock-offset synchronization** (Huber-ADMM robust fit, ported, BSD-2-Clause) applied in pyxdf's order; footers ignored entirely. **All four XDF datasets migrate**: AguileraRodriguez2025, Chen2017SingleFlicker, Rozado2015, Schrag2026Pediatric — moabb no longer needs pyxdf anywhere. The `moabb[xdf]` extra stays as an empty no-op so existing install commands don't break.

## Validation (real recordings, each dataset, vs pyxdf with its footer-crash bypassed)
| dataset | result |
|---|---|
| Rozado2015 | **bit-identical** (33×164,205) |
| Schrag2026Pediatric | **bit-identical** (16×255,488) |
| AguileraRodriguez2025 | **bit-identical**; end-to-end load with pyxdf import-blocked |
| Chen2017SingleFlicker | **bit-identical** (33×1,638,152; 200/200 stim markers on the identical sample) |

Unit test builds a synthetic XDF byte-for-byte (numeric + string streams, nested channel `desc`, a recorded clock offset, and the wild float-footer quirk). ruff clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9220fce4a034`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.