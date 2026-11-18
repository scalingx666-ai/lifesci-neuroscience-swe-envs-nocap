# Issue

**Title:** Add option to export spike waveforms subset to phy (mimic phy extract-waveforms)

## Description

## Summary
- Adds an `add_waveforms` option to `export_to_phy` that writes phy's `_phy_spikes_subset.{spikes,channels,waveforms}.npy` files, mimicking the `phy extract-waveforms` CLI command.
- Reuses the `SortingAnalyzer`'s `waveforms`/`random_spikes` extensions when already computed, and computes them on demand otherwise (skipping with a warning if there's no recording available).
- Handles both sparse and dense `SortingAnalyzer`/sparsity combinations, matching the sparsity already used for `templates.npy`/`pc_feature_ind.npy`.

## Test plan
- [x] Verified with `phylib.io.model.TemplateModel` (phy's own loader) that the exported files load correctly and return proper per-cluster waveforms, for both sparse and dense analyzers.
- [x] Verified stored waveform values exactly match manually-extracted raw-trace snippets (accounting for `nbefore`/uV scaling).
- [x] Add a unit test to `src/spikeinterface/exporters/tests/` covering `add_waveforms=True`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `297da5eb9c02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.