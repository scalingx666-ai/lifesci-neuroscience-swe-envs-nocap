# Issue

**Title:** CI: Update macOS version in release workflow

## Description

macos-13 runners are being shut down

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

MacOS 15 will be the last supported Intel runner

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e979efe659e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.