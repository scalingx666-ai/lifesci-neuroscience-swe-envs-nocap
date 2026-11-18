# Issue

**Title:** [SCHEMA] BEP032: Resolve the units TODO on MicroephysCoordinateUnits

## Description

This addresses Chris's question on #2307 about the `TODO: Clarify if units need to be used or enums, if units, define pixels` comment on `MicroephysCoordinateUnits`. The answer is the pattern that `iEEGCoordinateUnits` already uses: the field is an enum of length units plus `pixels`, `pixels` references the shared enum entry, and the description states that the units MUST be `"pixels"` when `MicroephysCoordinateSystem` is `Pixels`. The prose in the "Allowed 2D coordinate systems" section already says this, so this only brings the schema definition in line with it and removes the TODO. Same as iEEG, there is no validator check pairing the two values.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01QPCasNDSUAn4ZcoqBhXU5p

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f94d13fbb121`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.