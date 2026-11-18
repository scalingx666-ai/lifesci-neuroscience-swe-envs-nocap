# Issue

**Title:** Update S1 overlays.svg and documentation

## Description

## Summary
This PR updates the S1 subject's overlays.svg file and makes a minor documentation update to AGENTS.md.

## Changes
- **filestore/db/S1/overlays.svg**: Regenerated/optimized SVG file with significant size reduction (725 lines removed, 157 added)
- **AGENTS.md**: Minor documentation update to the agents guidance file

## Notes
The overlays.svg changes appear to be a regeneration or optimization of the Inkscape layer definitions for the S1 subject's ROIs and sulci mappings, resulting in a more compact file representation.

https://claude.ai/code/session_01QVmqpC7y5K5VsbJ6JPioZ7

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `557d87d9efb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.