# Issue

**Title:** Philips dixon fixes

## Description

## Summary

I have been using dcm2nii for a long time now and the only data that ever gave me troubles was philips dixon data. Philips Dixon reconstructions (Water/Fat/In-Phase/Out-of-Phase) had no representation in dcm2niix — they report `ComplexImageComponent=MAGNITUDE` like an ordinary image, so they silently merged with each other or with unrelated volumes. This PR adds detection for them and fixes a few related Enhanced MR sorting bugs found along the way.

## Fixes

- Recognize Water/Fat/In-Phase/Out-of-Phase via the legacy `(2005,140F)` per-frame `ImageType` tokens (`W`/`F`/`IP`/`OP`), the one representation that's stayed stable across a decade of Philips software (5.1.x through 12.3.0). Adds `_water`/`_fat`/`_inphase`/`_outphase` filename suffixes and matching JSON `ImageType` entries, same mechanism as the existing `_real`/`_imaginary`/`_ph`.
- Fixed a pre-existing stale-carryover bug in the `isKludgeIssue809` dimension rewrite that corrupted sort order for files declaring fewer than 3–4 dimensions.
- Fixed a Philips R12+ firmware regression where the `Effective Echo Time` dimension index goes constant (0) for plain multi-echo GRE/MESE series, even though `EffectiveEchoTime` itself still varies correctly — this caused unstable sort ties and could scramble slice order or fragment a coherent series into extra files. Falls back to the real echo time when the index is uninformative. Confirmed not to affect DTI/DWI, which key off a different, correctly-populated private dimension.
- Fixed `isRealIsPhaseMapHz` leaking across frames within one file (never reset per-frame), which could swap a B0 field map's name with an ordinary Real echo's.
- Fixed the Dixon detection being silently skipped on classic (non-Enhanced) DICOM: it was gated on `manufacturer == PHILIPS`, but on classic files `ImageType` (0008,0008) parses before `Manufacturer` (0008,0070) in tag order, so the check always failed. Removed the gate, matching the pre-existing ungated style of the neighboring `_R_`/`_M_`/`_I_`/`_P_` checks.
- Filled a gap where Turbo-Spin-Echo Dixon series (recon-only, all four types sharing one fixed TE) bundled into a single multi-volume file instead of splitting like their GRE counterparts.

Mechanism details in `docs/PHILIPS_DIXON.md`.

## Testing

Real Philips data, software 5.1.x/5.7.x through 12.3.0, both classic and Enhanced MR: Dixon source (Magnitude/Real/Imaginary/Phase) and recon (Water/Fat/In-Phase/Out-of-Phase) series from both GRE- and TSE-Dixon sequences, plain multi-echo GRE/MESE with no Dixon option set, and DTI/DWI. Also ran the in-tree regression suite (`dcm_qa`, `dcm_qa_nih`, `dcm_qa_uih`) — no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a82ad9d97f75`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.