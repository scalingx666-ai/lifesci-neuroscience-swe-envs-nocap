# Issue

**Title:** Support SpikeInterface recordings in phy application workflows

## Description

SpikeInterface provenance JSON and saved Zarr recordings now have documented phy workflows and application-level coverage. Standalone TraceGUI accepts CLI string paths, preserves all binary parts from params.py, and reports empty or unsupported inputs before creating the GUI.

Builds on cortex-lab/phylib#68. The integration job pins phylib commit ded47ba902b4470405138e8af7febd8d02094b1b (also containing cortex-lab/phylib#69) and SI 0.105.3. Ordinary dependencies remain compatible with released phylib; source installation is documented until a supporting release is published. Navigation prefetch wiring is stacked separately in #1433.

Validation:
- Full source-backed suite: 657 passed, 1 skipped; lint and formatting passed.
- Eight focused application tests passed with SI; released-phylib checks: 4 passed, 4 optional SI cases skipped.
- Relative provenance, lazy preprocessing, reordered channels, raw/high-pass traces and waveforms, JSON/Zarr loading, concatenated binaries, and cleanup are covered.
- Documentation generation/strict build passed with released phylib; sdist/wheel builds and isolated wheel import checks passed with released and source phylib.

Remote-recording latency has not been benchmarked; this PR does not enable background navigation prefetching.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bce183fa5bbf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.