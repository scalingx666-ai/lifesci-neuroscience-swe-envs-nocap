# Issue

**Title:** CI: check out RobustToolbox so nightly walkthroughs pass (weighted_corrcoef dep)

## Description

Fixes the **nightly `tests-walkthroughs`** job, which has failed every night since the walkthrough suite landed.

**Root cause (not headless):** `canlab_test_walkthrough_5_regression` errors at section 16 with
```
MATLAB:UndefinedFunction — Undefined function 'weighted_corrcoef'
  at plot_correlation_samefig (line 118)   % robust-correlation branch
```
`weighted_corrcoef` ships in **`canlab/RobustToolbox`** (`Robust_stats_functions/`) — a dependency of `plot_correlation_samefig`'s robust branch, which the regression walkthrough exercises (`plot_correlation_samefig(..., 1)`). A normal `canlab_toolbox_setup` install puts RobustToolbox on the path; the CI runner didn't check it out.

The fault-tolerant harness is working correctly — the display-only sections in walkthroughs 4b/7 skip gracefully. This was purely a missing path dependency; the only genuine (non-environment) error was the missing function. The failure gate is `if any([results.Failed])`, so the unrelated "1 incomplete" (walkthrough 1 assumption-skip) is harmless.

**Fix:** check out `canlab/RobustToolbox` and `addpath(genpath('RobustToolbox'))`, mirroring the other sibling-repo checkouts.

**Verified locally:** removing RobustToolbox from the path reproduces the exact error; restoring it runs `plot_correlation_samefig`'s robust path cleanly. A `workflow_dispatch` run on this branch is in progress to confirm the full headless nightly goes green.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f4f2bc98c80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.