# Issue

**Title:** BF: commit file deletions in `run --explicit --output`

## Description

When using `datalad run --explicit` with `--output`, files deleted by the command were not being committed. This happened because the post-command re-glob only returns files that exist on disk, so deleted outputs were silently excluded from the save operation.

Fix by capturing the pre-command output expansion before the re-glob refresh, then adding back any previously-matched files that no longer exist on disk.

-  

### PR checklist

- [x] Provide an overview of the changes you're making and explain why you're proposing them.
- [x] Create a changelog snippet (add the `CHANGELOG-missing` label to this pull request in order to have a snippet generated from its title;
  or use `scriv create` locally and include the generated file in the pull request, see [scriv](https://scriv.readthedocs.io/)).
- [x] Include `Fixes #NNN` somewhere in the description and `scriv` changelog entry if this PR addresses an existing issue.


@asmacdo -- might like to try it out if works for your case

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26defa52ae1d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.