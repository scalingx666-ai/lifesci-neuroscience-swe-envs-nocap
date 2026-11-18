# Issue

**Title:** UPDATE: plugin refractoring, NIfTI data

## Description

This PR refractors the plugin code by better separating it from the main code-base (Plugin class), and adds some code for NIfTI data.

It also ties up a few loose ends after recent merges:
- redundant specification of OpenNFT_UI in config.py
- double specification of onChangeDataType in opennft.py

Additional debugs:
- for rtqa

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d419564a0a49`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.