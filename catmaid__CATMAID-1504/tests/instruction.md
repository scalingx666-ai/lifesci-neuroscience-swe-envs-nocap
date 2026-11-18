# Issue

**Title:** Connector Viewer: Connectors between two skeleton sets

## Description

Improves constraint system to allow users to view connectors only between two sets of skeletons.

This shouldn't be merged yet as it definitely breaks the 'open viewer' button on the connector table; I just thought I'd put the connector viewer changes up for review.

How the filtering works is kind of intuitive but also has a couple of gotchas so it might be best if there was somewhere I could just make it explicit? Maybe the wiki, maybe readthedocs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5dfc08e2faaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.