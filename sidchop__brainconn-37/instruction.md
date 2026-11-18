# Issue

**Title:** Make citation more prominent in README

## Description

This PR addresses the request to make the citation information more prominent in the README by moving it from the bottom of the document to a much more visible location and improving its formatting.

## Changes Made

- **Relocated citation section**: Moved from the bottom of the README to immediately after the Installation section, before the Use section
- **Enhanced visibility**: Made all citation text **bold** for better prominence
- **Improved formatting**: Restructured the citation with clearer instructions ("If you use this package in your research, please cite:") and better line breaks
- **Consistent updates**: Modified both `README.Rmd` (source) and `readme.md` (generated) files

## Before and After

**Before**: The citation was buried at the very end of the README in a basic "Citations" section that users might miss.

**After**: The citation now appears prominently where users naturally look after learning how to install the package, with bold formatting that makes it impossible to miss.

This change significantly improves the likelihood that researchers will properly cite the associated paper when using brainconn in their publications, as requested in the original issue.

<!-- START COPILOT CODING AGENT SUFFIX -->

<!-- START COPILOT CODING AGENT TIPS -->
---

💬 Share your feedback on Copilot coding agent for the chance to win a $200 gift card! Click [here](https://survey3.medallia.com/?EAHeSx-AP01bZqG0Ld9QLQ) to start the survey.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `980a50421955`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.