# Issue

**Title:** Native support for scanbox sbx files and console entry point.

## Description

Summary of changes:

- Native support for sbx files.
- Function for memory mapping sbx files.
- Remove columns from bidirectional sbx file when loading.
- QComboBox option to select the input format on the GUI.
- Force stdout flush on print in runs2p.
- Notebook example for getting some ops settings from sbx files.
- Docs for sbx input.
- Console entry point for suite2p.
- Command line options to specify options and query default parameters.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01500cdbcaa0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.