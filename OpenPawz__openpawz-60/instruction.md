# Issue

**Title:** Fix/integration awareness oauth guard

## Description

This pull request introduces a new animated hero logo component for the dashboard, improves documentation for OAuth app registration, and makes small UI and data visualization tweaks. The most significant change is the addition of the `hero-logo.ts` file, which provides a visually rich, interactive status ring for system components. The documentation updates clarify registration steps and progress tracking. Minor UI improvements include animation adjustments and a legend for heatmap visualizations.

**New Feature: Animated Hero Logo**

* Added `src/components/hero-logo.ts` — Implements the OpenPawz hero logo with an animated orbital status ring, breathing glow, pointer-driven parallax, and reactive segment states for system components.

**Documentation Improvements**

* Rewrote and reorganized `docs/oauth-registration-checklist.md` to clarify registration instructions, add platform-specific notes, progress tracking, and priority order for OAuth app setup. [[1]](diffhunk://#diff-cabc592f547d5b30f491970da1ac6e78208735b4d802de199a4e4be4f01951cdL3-R55) [[2]](diffhunk://#diff-cabc592f547d5b30f491970da1ac6e78208735b4d802de199a4e4be4f01951cdL340-R411)

**UI and Animation Tweaks**

* Removed scale transformation from `viewEnter` and `viewLeave` animations in `src/components/animations.ts` for smoother transitions. [[1]](diffhunk://#diff-5da0d96155c5c97191f10330e3a112c04e924442709f627a19a18b060ea85d0bL17) [[2]](diffhunk://#diff-5da0d96155c5c97191f10330e3a112c04e924442709f627a19a18b060ea85d0bL30)

**Data Visualization Enhancement**

* Added a heatmap legend to `heatmapStrip` in `src/components/molecules/data-viz.ts` for improved interpretability of data visualizations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eff7ce058774`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.