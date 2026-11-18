# Issue

**Title:** Create the plugins folder before installing an extension

## Description

plugin_install downloaded the extension archive into the plugins folder without creating it, so fresh installs lacking that folder failed with a generic download error. The folder is now created when missing. Syntax checked; the download itself was not exercised offline.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2922a4cb05d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.