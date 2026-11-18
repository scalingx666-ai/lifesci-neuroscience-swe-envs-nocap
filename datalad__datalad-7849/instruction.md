# Issue

**Title:** BF: skip pointless `git push --dry-run` for special remotes in push

## Description

`_push()` unconditionally ran `git push --dry-run` to determine refspecs, even when the target is a git-annex special remote (e.g. WebDAV, S3, directory) that has no git URL. This was wasteful at best and could cause errors or significant slowdowns for remotes like WebDAV.

The fix moves the `target_is_git_remote` check (based on `remote.<name>.url` existence) before the dry-run block and guards the entire dry-run + refspec computation with it. For pure special remotes, the function now skips straight to publication dependencies and data transfer.

The original code even had a TODO comment acknowledging this:
  "# TODO prevent this when `target` is a special remote"

Ported from datalad-next's `push_optimize.py` patch (https://github.com/datalad/datalad-next), which replaces `_push()` entirely with a restructured version. This commit takes a more surgical approach: the same logical change but preserving the existing code structure for minimal diff on the maintenance branch.

-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47222ca001d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.