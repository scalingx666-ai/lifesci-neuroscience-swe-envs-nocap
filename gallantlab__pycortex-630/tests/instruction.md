# Issue

**Title:** FIX dataset dropdown auto-resizes to fit long dataset names

## Description

## Summary
- : the dataset dropdown selector had a hardcoded `max-width: 400px`, so long dataset names wrapped onto multiple lines and looked ugly.
- Replaced with `width: max-content` (capped at `90vw`) on `#dataopts` and `ul#datasets`, plus `white-space: nowrap` on each list item, so the dropdown auto-fits the longest dataset name and gracefully caps at the viewport width.
- Added `Viewer.fitDataname()` to auto-shrink the `#dataname` heading font-size when a long name would otherwise overflow the panel cap, so the heading still fits cleanly. Called after each `setData` and on window resize.

## After

![dropdown auto-resizes and heading shrinks](https://raw.githubusercontent.com/gallantlab/pycortex/4af8168b659a3da781da52b02845d43a69672f32/.github/screenshots/issue-628-after.png)

(Compare with the "before" screenshot in #628.)

## Test plan
- [x] Open viewer with 1 short dataset name → dropdown stays at sensible width, heading at full 24pt
- [x] Open viewer with 5 datasets including very long names → dropdown widens to fit, no wrapping or horizontal scrollbar; heading shrinks to fit the panel
- [x] Verified `ul#datasets`'s `scrollWidth === clientWidth` (no clipped horizontal overflow)
- [x] Verified `#dataname.scrollWidth <= clientWidth` for long names (no clipped heading)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c70ddf5f1607`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.