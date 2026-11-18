# Issue

**Title:** [ENH ] allow using submodule {path_basename} as props for url rewrite

## Description

When setting-up online rewrite rule for git submodule URL to facilitate inter-operability of different hosting platforms that do or dont allow hierarchical naming of repos (eg. gitlab vs github/forgejo/ ), it can be useful to use the basename of the submodule path.
This PR simply adds that `{basename}` tag to the rewrite props.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ef9038c9c8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.