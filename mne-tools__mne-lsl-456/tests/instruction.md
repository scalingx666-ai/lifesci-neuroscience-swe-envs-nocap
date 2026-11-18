# Issue

**Title:** Minor editing fixes for JOSS paper

## Description

[Part of JOSS review at: openjournals/joss-reviews#8088]
- fix duplicated word
- mention LSL abbreviation earlier
- use slightly different format for GitHub citations
- uniformly cite "... contributors"

Please merge if you agree with the changes. Most should be uncontroversial, the only fundamental change is to replace the Stenner, Boulay, et al. authorship by the more generic "LabStreamingLayer contributors". I'd err on the side of caution here in the absence of clear citation information from the project itself, since  a list of names should at least include the original author C. Kothe (note they are the only author mentioned in the PyPI package).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32d0f57aa6d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.