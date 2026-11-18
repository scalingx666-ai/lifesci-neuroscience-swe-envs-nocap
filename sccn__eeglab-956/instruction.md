# Issue

**Title:** Fix component colorbar tick placement in pop_topoplot

## Description

## Summary

Use the axes returned by `cbar` consistently in `pop_topoplot`, rather than relying on the current axes. Keep numeric labels for scales that do not cross zero. For signed component scales, calculate the zero tick from the colorbar limits so that all ticks are increasing and zero is placed correctly on asymmetric scales.

No component values or color limits are changed.

Add eleven regression tests and run the core `tests` folder in the existing MATLAB CI job when a MATLAB license token is available.

## Verification

MATLAB R2025b on Apple silicon, based on `sccn/eeglab:develop` at `5c27fc095bc43216ffccdb027f7c40477edf3e2f`.

Before the fix, the new tests produced 5 passes and 6 failures. Afterward, all 11 passed. Coverage includes positive, negative, symmetric, asymmetric, zero endpoint and default limits, multiple maps, a zero component, and an unrelated axes.

All four original DIPFIT cases passed in a fresh, fully initialized EEGLAB session. The original BEM plotting call then passed 20 repetitions interleaved with other axes and color scales. The broader EEGLAB run also passed the original BEM case. Representative numeric and asymmetric signed colorbars were rendered and visually inspected.

A preliminary `eeglab nogui` run lacked DIPFIT model search paths and failed before plotting. The fresh validation above uses the normal EEGLAB startup that initializes the installed plugin. The original intermittent plotting trigger is not claimed to be fully explained by the synthetic cases alone.

```matlab
results = runtests('tests/test_pop_topoplot_colorbar.m');
assertSuccess(results);
```

This is problem 4 of the requested local test repair and is independent of the event selection fix in #955.

Octave smoke testing passed. The MATLAB CI execution steps were skipped because the license token was unavailable. The automated review action failed while fetching an unavailable submodule revision, before reviewing this change. These CI limitations are separate from the local MATLAB results above.

Companion test runner and LIMO work:  and

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c27fc095bc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.