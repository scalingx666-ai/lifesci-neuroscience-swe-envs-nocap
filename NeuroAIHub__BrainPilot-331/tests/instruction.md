# Issue

**Title:** docs: use PNGs for README overview figures

## Description

## Summary

- replace the README overview SVGs with high-resolution PNGs
- render every PNG onto an opaque white background for reliable GitHub dark-mode display
- keep separate English and Chinese knowledge-service overview images
- remove the superseded SVG assets

## Verification

- all PNGs are 2400 px wide, RGB, and contain no alpha channel
- visually checked all three rendered assets
- rendered both READMEs through GitHub GFM
- verified all local image paths and ran `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `408c7bcbe0aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.