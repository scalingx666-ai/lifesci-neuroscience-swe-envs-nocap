# Issue

**Title:** FIX: Scale full-normalized multitaper coefficients by sqrt(sfreq)

## Description

#### Reference issue

.

#### What does this implement/fix?

`normalization="full"` turns the multitaper estimate into a density by dividing power by the sampling rate. The complex coefficients are amplitudes, so the same convention divides them by `sqrt(sfreq)`. Dividing those coefficients by `sfreq` made `_psd_from_mt` recover a spectrum too small by another factor of `sfreq` (0.01 at 100 Hz in the report). `output="power"` is unchanged. `normalization="length"` is unchanged because it does not apply this extra scale.

#### Additional information

AI assistance: Grok 4.7 in Cursor drafted the scaling change, the regression test, and this description, after I asked it to check the amplitude-versus-power normalization and then to fix the issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `379cfabd03db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.