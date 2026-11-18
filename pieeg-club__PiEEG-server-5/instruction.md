# Issue

**Title:** perf: adaptive rendering, channel selector, throttled draws

## Description

- ChannelCanvas: DPR capped to 1 for grid (full DPR on expand), 30fps staggered draw across channels, ResizeObserver replaces per-frame getBoundingClientRect, skip-draw on unchanged data, adaptive quality (high/medium/low) auto-adjusts to frame budget
- App: channel selector bar with All/None toggles, mobile defaults to 4 active channels, inactive channels run zero JS (no RAF)
- SpectralPanel: ResizeObserver, increased FFT interval to 12 frames
- useEEG: timestamp splice deferred to UI update (125x fewer splices)
- CSS: channel selector bar, inactive channel placeholder styles
- Flat alpha fill replaces per-frame createLinearGradient

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c59467baab4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.