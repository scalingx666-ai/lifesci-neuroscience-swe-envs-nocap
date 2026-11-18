# Issue

**Title:** Data plot widget

## Description

> The whole "draw" function is almost identical to that of the Circuit Graph Plot and could be easily refactored. Just didn't want to meddle with it; would have to create it in the SVG utils under js/libs somewhere, and perhaps it isn't necessary as this widget will likely evolve beyond what the CircuitGraphPlot presently supports.

from @acardona

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76b4247bbad9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.