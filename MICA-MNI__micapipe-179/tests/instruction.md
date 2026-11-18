# Issue

**Title:** Fold in lamar's unique work: mic2bids MP2RAGE naming + drop unreferenced 1mm atlas

## Description

. That PR merged the comprehensive cleanup into v1; this picks up the one commit added afterward (`af2183d`) while folding in the only substantive, non-`old/` work from the now-deleted `lamar` branch.

## Changes
- **`functions/mic2bids`**: MP2RAGE BIDS naming schema (`inv-1`/`inv-2_MP2RAGE`, `UNIT1`, `T1map`) and a bids-validator 2.x (deno `jsr:@bids/validator`) hint.
- **Drop unreferenced `MNI152Volumes/MNI152_T1_1mm{,_brain,_brain_mask}.nii.gz`** (~14.7 MB): no code references them (pipeline uses 0.8mm/2mm/3mm).

## Deliberately excluded
- lamar's `old/` legacy-doc churn (v1 already drops `old/`).
- lamar's `sym_09a` atlas add — not referenced by any code, would be dead weight.
- lamar's plain `Dockerfile` channel tweak — moot post-cleanup (replaced by `Dockerfile.main`/`Dockerfile.mamba-base`).

build-main CI is green on this branch.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9dd05873fcf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.