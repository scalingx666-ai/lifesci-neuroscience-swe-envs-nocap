# Issue

**Title:** fix(rppg-web): weight multi-ROI fusion in RGB-space, not post-CHROM

## Description

## Summary

`MultiRoiRppgFuser` weighted each ROI's already-CHROM-filtered pulse signal by that signal's own spectral SNR. Chari et al. ("Diverse R-PPG: Camera-Based Heart Rate Estimation for Diverse Subject Skin-Tones and Scenes") benchmarked exactly this against a diverse-skin-tone dataset and found it *increases* skin-tone bias relative to plain unweighted spatial averaging.

The mechanism: darker skin reflects less light, so the raw pixel intensity is lower, so the sensor's photon/read-noise floor, but not the physiology already lowers that region's post-processing SNR. The paper's own noise analysis shows this bias is a camera-noise effect, not a biophysical one (SIR is melanin-independent once light transport is modeled). Weighting by that SNR after independently filtering each region systematically down-weights darker-skin regions for a reason unrelated to signal quality.

## Fix

Move the SNR-driven weighting to RGB-space: blend the raw per-ROI RGB averages first, then run **one** shared CHROM + bandpass pipeline on the blend. Per-ROI CHROM/bandpass still runs on each region - it's now purely the SNR probe that drives the weights, and no longer feeds the fused output directly.

Honest limit: this ports the paper's RGB-space-weighting recommendation, not its second, larger recommendation (an explicit skin-diffuse-component weight derived from per-pixel specular-highlight detection) - this module only ever receives an already-averaged `RoiRgbSample` per region per frame, not the raw per-pixel data specular detection would need. That's a bigger change, not silently implied to already be done here.

## Test plan

- `tsc -p . --noEmit` - clean
- `biome lint src` - clean
- `pnpm run build` - dist compiles and Node-ESM-verifies cleanly
- Full package test suite: 351/351 passing (43 suites), all pre-existing `multiRoiFusion` tests (weight normalization, clean-ROI dominance, skin-fraction skip, reset) pass unchanged
- Added a construction-verified test: independently reproduces the expected fused value from a weighted-RGB blend run through a fresh CHROM+bandpass pair over 90 frames (long enough for CHROM's window to fill, so it's not a trivial zero-equals-zero check), and asserts it matches the module's actual output
- Confirmed the new test is a real guard, not a vacuous one: reverted only the fix and watched the test fail (expected ≈0.0423, received ≈-0.0266) before restoring the fix and confirming it passes again

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49fdb41d0593`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.