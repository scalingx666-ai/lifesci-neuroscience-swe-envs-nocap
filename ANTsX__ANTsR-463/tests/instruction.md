# Issue

**Title:** CI: save ANTsRCore binary under its standard file name

## Description

Windows check jobs fail while installing the ANTsRCore release binary:

```
Error in read.dcf(file.path(pkgname, "DESCRIPTION"), c("Package", "Type")) :
  cannot open the connection
Calls: install.packages -> .install.winbinary -> unpackPkgZip -> read.dcf
```

R infers the package name from a binary's file name by stripping `_<version>.zip`. The release asset `ANTsRCore_0.8.4_release-R4.6.zip` doesn't match that pattern, so R looks for the wrong `DESCRIPTION`. This saves the download as `ANTsRCore_<ver>.<ext>` (e.g. `ANTsRCore_0.8.4.zip`) instead.

Example failure: https://github.com/ANTsX/ANTsR/actions/runs/40930064236/job/123645816727 (PR #445). Open PRs will need a fresh run (update branch or close/reopen) after this merges.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `457095b1408e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.