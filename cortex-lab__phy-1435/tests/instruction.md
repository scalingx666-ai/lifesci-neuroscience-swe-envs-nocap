# Issue

**Title:** Add Trace View navigation to short-ISI spike pairs

## Description

Researchers inspecting refractory-period violations currently have to step through every spike in the Trace View. This adds a **Go to next short isi** action (`Shift+Alt+PageDown`) that jumps to the leading spike of the next pair with an interval strictly below the refractory period in the first open Correlogram View.

The action uses all spikes from the first selected cluster, reads the current threshold on each invocation, and wraps at the end. With no matching pair or no open correlogram, it leaves the current time unchanged. The search uses bounded blocks, and navigation continues correctly when the viewport is clipped at a recording boundary. Selection changes and manual navigation reset its position.

Tests cover empty and single-spike inputs, exact threshold boundaries, duplicate timestamps, block boundaries, wraparound, the registered menu action, changed thresholds and selections, and clipped viewports. The documentation includes the behavior and shortcut.

Validation: [fork CI](https://github.com/AtomicGlance/phy/actions/runs/41295668336) passed on Linux, Windows, and macOS with Python 3.10, 3.11, and 3.12. The Linux Python 3.12 suite reported 663 passed, 1 skipped. Lint, formatting, generated documentation checks, and the package build also passed. Local GUI setup was blocked by interrupted dependency downloads, so the complete GUI validation was run in CI.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae9f80b6b39a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.