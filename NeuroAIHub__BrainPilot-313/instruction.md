# Issue

**Title:** docs: add evaluation and research visuals to README

## Description

## Summary

- add current system and knowledge-service overview figures to both READMEs
- surface ALE and preliminary BrainPilotBench-v0 results before Quick Start
- replace long case-study prose with a compact 2x2 grid for RSC, visual hierarchy, fMRI pain, and motor-imagery EEG
- add the BrainPilot Slack entry at the top and in Community
- remove the hosted-corpus statistics graphic and item count

## Scientific qualifiers

- RSC decoding uses the confirmed MAE of 16.8 cm (r = 0.646)
- visual-hierarchy and EEG cards retain non-significance qualifiers
- BrainPilotBench-v0 is explicitly marked preliminary, with pending and failed runs defined
- the ALE figure removes the stale T2 partial-credit-ceiling note; full credit is 1.00

## Verification

- rendered both READMEs through GitHub GFM
- validated SVG XML and all local image paths
- ran `git diff --check`

The BrainPilotBench GitHub repository is currently private, so the public README links only the leaderboard and public Hugging Face task data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b596d3d24c91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.