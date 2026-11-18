# Issue

**Title:** Fix TraceImageView channel ordering

## Description

TraceImageView builds its image in input channel order, so datasets whose channel order differs from physical depth disagree with TraceView.

Reorder the image rows using TraceView's existing channel ranks before applying the origin flip. This preserves the established ordering of channels at equal depths. The regression compares the actual image texture with TraceView's screen positions for sorted, shuffled, equal-depth, and single-channel layouts, including bottom → top → bottom origin changes. Includes an Unreleased changelog entry.

.

Validation on Linux/WSL with Python 3.12.3 and the locked dependencies, after rebasing onto `a71284c`:

- `make test-full`: 757 passed, 5 skipped; Ruff lint and formatting passed.
- `make doc-check` and Codespell: passed.
- `phy/cluster/views/trace.py`: 100% line coverage.

Native rendering remains unvalidated locally. A separate November 5 run of the four native OpenGL diagnostics produced black initial frames with and without this fix on base `3ee5707`, using WSL/Xvfb and herbstluftwm. Those native checks were not rerun for this rebase; the full OS/Python matrix is left to CI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a71284c1db2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.