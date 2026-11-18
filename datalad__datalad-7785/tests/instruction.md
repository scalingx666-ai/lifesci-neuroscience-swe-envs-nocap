# Issue

**Title:** Add --message option to clone, create, and update

## Description

## Summary

Add `--message/-m` option to `clone`, `create`, and `update` commands, allowing users to specify custom commit messages when registering subdatasets in parent datasets.

- `clone -d . -m "message"  <source>` - customizes the "[DATALAD] Added subdataset" commit
- `create -d .  -m "message" <path>` - customizes the "[DATALAD] Created subdataset" commit
- `update -r --how=merge -m "message"` - customizes the "[DATALAD] Save updated subdatasets" commit

The message only affects the parent dataset's commit, not any commits within the subdataset itself.

## Related

This partially addresses #3316. That issue requests `--message` for all committing commands. This PR covers the three main subdataset registration cases (`clone`, `create`, `update`), but does not address other commands like `addurls`, `add_readme`, `no_annex`, or `subdatasets` which also have hardcoded commit messages.

It might also address #3896, though I'm not sure that there was consensus on that.

## TODO

- [x] Add `CHANGELOG-missing` label
- [x] Add semver label

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f33225925ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.