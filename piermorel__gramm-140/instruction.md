# Issue

**Title:** Add Vega export functionality for gramm plots

## Description

Introduces `export_vega.m` to enable exporting gramm plots to interactive Vega visualizations, including support for various chart types (`geom_*` methods), color grouping, tooltips, and interactive legends. 

Adds a corresponding test file `export_vega_test.m` and updates `functionSignatures.json` to register the new export function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b89e7beb995`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.