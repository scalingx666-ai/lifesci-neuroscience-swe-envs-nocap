# Issue

**Title:** Add antsApplyTransformsToTRX

## Description

<!--
Text in these brackets are comments, and won't be visible when you submit your
pull request.

We welcome contributions to ANTs. Pull requests will be reviewed by the
developers and if accepted, become part of ANTs, distributed under the license
terms in COPYING.txt.

Please title your PR according to what it does:
ENH: new or improved functionality
PERF: performance enhancements to existing functionality
BUG: fixing a run time bug
COMP: relating to compilation
DOC: documentation changes
WIP: work in progress, needs further commits to be ready
-->

 

# Description

This PR adds a command line executable `antsApplyTransformsToTRX`, which can apply ITK warps to streamline coordinates. This replaces a workflow that was similar to GIFTI, where we used to convert the coordinates to a csv and use antsApplyTransformsToPoints. 

The ITK remote module buffers the coordinates so this ends up requiring very little memory, even with gigantic streamline datasets. 

The TractographyTRX remote module needs an update to build with the most recent 6.0 beta, but the rest of this code is ready for review!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ceb21bad7fae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.