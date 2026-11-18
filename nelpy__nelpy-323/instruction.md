# Issue

**Title:** Reduce noisy support/fs logging and avoid confusing internal fs deprecation warnings

## Description

This PR reduces warning spam in common support-restriction and ASA initialization workflows while preserving behavior and API semantics.

What changed

Demoted expected clipping/support diagnostics from warning to info in key paths.
Switched those noisy messages to module loggers so they can be filtered at nelpy logger scope.
Updated ASA internal support construction to call get_contiguous_segments with step only, preventing the confusing internal fs deprecation warning.
Kept clipping/restriction behavior unchanged.
Added focused regression tests for logging behavior.

Why
Users reported frequent, noisy messages that are expected during normal workflows, including:

ignoring events/signal outside support
support creation and fs estimation diagnostics
fs deprecation messaging triggered indirectly during ASA construction
Linked issues

Addresses [)
Addresses [)
Related discussion [)
Fixes the confusion described in [)
Related discussion: [)
Files touched

[_eventarray.py](vscode-file://vscode-app/c:/Users/Cornell/AppData/Local/Programs/Microsoft%20VS%20Code/e7fb5e96c0/resources/app/out/vs/code/electron-browser/workbench/workbench.html)
[_analogsignalarray.py](vscode-file://vscode-app/c:/Users/Cornell/AppData/Local/Programs/Microsoft%20VS%20Code/e7fb5e96c0/resources/app/out/vs/code/electron-browser/workbench/workbench.html)
[utils.py](vscode-file://vscode-app/c:/Users/Cornell/AppData/Local/Programs/Microsoft%20VS%20Code/e7fb5e96c0/resources/app/out/vs/code/electron-browser/workbench/workbench.html)
[test_logging_filtering.py](vscode-file://vscode-app/c:/Users/Cornell/AppData/Local/Programs/Microsoft%20VS%20Code/e7fb5e96c0/resources/app/out/vs/code/electron-browser/workbench/workbench.html)



Notes for reviewers
This is intentionally a minimal, behavior-preserving pass focused on high-noise warnings.
Some warning-level messages remain in place where they are likely actionable (for example genuine input/deprecation cases outside the scoped noisy paths).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0dbabfe10fb0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.